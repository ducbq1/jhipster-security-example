import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpResponse } from '@angular/common/http';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { RouterTestingModule } from '@angular/router/testing';
import { of, Subject, from } from 'rxjs';

import { SysRoleFormService } from './sys-role-form.service';
import { SysRoleService } from '../service/sys-role.service';
import { ISysRole } from '../sys-role.model';

import { SysRoleUpdateComponent } from './sys-role-update.component';

describe('SysRole Management Update Component', () => {
  let comp: SysRoleUpdateComponent;
  let fixture: ComponentFixture<SysRoleUpdateComponent>;
  let activatedRoute: ActivatedRoute;
  let sysRoleFormService: SysRoleFormService;
  let sysRoleService: SysRoleService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule, RouterTestingModule.withRoutes([])],
      declarations: [SysRoleUpdateComponent],
      providers: [
        FormBuilder,
        {
          provide: ActivatedRoute,
          useValue: {
            params: from([{}]),
          },
        },
      ],
    })
      .overrideTemplate(SysRoleUpdateComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(SysRoleUpdateComponent);
    activatedRoute = TestBed.inject(ActivatedRoute);
    sysRoleFormService = TestBed.inject(SysRoleFormService);
    sysRoleService = TestBed.inject(SysRoleService);

    comp = fixture.componentInstance;
  });

  describe('ngOnInit', () => {
    it('Should update editForm', () => {
      const sysRole: ISysRole = { id: '1361f429-3817-4123-8ee3-fdf8943310b2' };

      activatedRoute.data = of({ sysRole });
      comp.ngOnInit();

      expect(comp.sysRole).toEqual(sysRole);
    });
  });

  describe('save', () => {
    it('Should call update service on save for existing entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<ISysRole>>();
      const sysRole = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
      jest.spyOn(sysRoleFormService, 'getSysRole').mockReturnValue(sysRole);
      jest.spyOn(sysRoleService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ sysRole });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: sysRole }));
      saveSubject.complete();

      // THEN
      expect(sysRoleFormService.getSysRole).toHaveBeenCalled();
      expect(comp.previousState).toHaveBeenCalled();
      expect(sysRoleService.update).toHaveBeenCalledWith(expect.objectContaining(sysRole));
      expect(comp.isSaving).toEqual(false);
    });

    it('Should call create service on save for new entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<ISysRole>>();
      const sysRole = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
      jest.spyOn(sysRoleFormService, 'getSysRole').mockReturnValue({ id: null });
      jest.spyOn(sysRoleService, 'create').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ sysRole: null });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: sysRole }));
      saveSubject.complete();

      // THEN
      expect(sysRoleFormService.getSysRole).toHaveBeenCalled();
      expect(sysRoleService.create).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).toHaveBeenCalled();
    });

    it('Should set isSaving to false on error', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<ISysRole>>();
      const sysRole = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
      jest.spyOn(sysRoleService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ sysRole });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.error('This is an error!');

      // THEN
      expect(sysRoleService.update).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).not.toHaveBeenCalled();
    });
  });
});
