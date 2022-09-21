import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpResponse } from '@angular/common/http';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { RouterTestingModule } from '@angular/router/testing';
import { of, Subject, from } from 'rxjs';

import { SysUserFormService } from './sys-user-form.service';
import { SysUserService } from '../service/sys-user.service';
import { ISysUser } from '../sys-user.model';
import { ISysRole } from 'app/entities/sys-role/sys-role.model';
import { SysRoleService } from 'app/entities/sys-role/service/sys-role.service';

import { SysUserUpdateComponent } from './sys-user-update.component';

describe('SysUser Management Update Component', () => {
  let comp: SysUserUpdateComponent;
  let fixture: ComponentFixture<SysUserUpdateComponent>;
  let activatedRoute: ActivatedRoute;
  let sysUserFormService: SysUserFormService;
  let sysUserService: SysUserService;
  let sysRoleService: SysRoleService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule, RouterTestingModule.withRoutes([])],
      declarations: [SysUserUpdateComponent],
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
      .overrideTemplate(SysUserUpdateComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(SysUserUpdateComponent);
    activatedRoute = TestBed.inject(ActivatedRoute);
    sysUserFormService = TestBed.inject(SysUserFormService);
    sysUserService = TestBed.inject(SysUserService);
    sysRoleService = TestBed.inject(SysRoleService);

    comp = fixture.componentInstance;
  });

  describe('ngOnInit', () => {
    it('Should call SysRole query and add missing value', () => {
      const sysUser: ISysUser = { id: '1361f429-3817-4123-8ee3-fdf8943310b2' };
      const ids: ISysRole[] = [{ id: '418a4299-03de-48d2-add7-24fa35aaf74c' }];
      sysUser.ids = ids;

      const sysRoleCollection: ISysRole[] = [{ id: 'e5cfeacf-62c5-46ca-bb46-5ad40ae2ce8f' }];
      jest.spyOn(sysRoleService, 'query').mockReturnValue(of(new HttpResponse({ body: sysRoleCollection })));
      const additionalSysRoles = [...ids];
      const expectedCollection: ISysRole[] = [...additionalSysRoles, ...sysRoleCollection];
      jest.spyOn(sysRoleService, 'addSysRoleToCollectionIfMissing').mockReturnValue(expectedCollection);

      activatedRoute.data = of({ sysUser });
      comp.ngOnInit();

      expect(sysRoleService.query).toHaveBeenCalled();
      expect(sysRoleService.addSysRoleToCollectionIfMissing).toHaveBeenCalledWith(
        sysRoleCollection,
        ...additionalSysRoles.map(expect.objectContaining)
      );
      expect(comp.sysRolesSharedCollection).toEqual(expectedCollection);
    });

    it('Should update editForm', () => {
      const sysUser: ISysUser = { id: '1361f429-3817-4123-8ee3-fdf8943310b2' };
      const id: ISysRole = { id: '10972476-1d17-409a-a9a0-925cd2bcb883' };
      sysUser.ids = [id];

      activatedRoute.data = of({ sysUser });
      comp.ngOnInit();

      expect(comp.sysRolesSharedCollection).toContain(id);
      expect(comp.sysUser).toEqual(sysUser);
    });
  });

  describe('save', () => {
    it('Should call update service on save for existing entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<ISysUser>>();
      const sysUser = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
      jest.spyOn(sysUserFormService, 'getSysUser').mockReturnValue(sysUser);
      jest.spyOn(sysUserService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ sysUser });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: sysUser }));
      saveSubject.complete();

      // THEN
      expect(sysUserFormService.getSysUser).toHaveBeenCalled();
      expect(comp.previousState).toHaveBeenCalled();
      expect(sysUserService.update).toHaveBeenCalledWith(expect.objectContaining(sysUser));
      expect(comp.isSaving).toEqual(false);
    });

    it('Should call create service on save for new entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<ISysUser>>();
      const sysUser = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
      jest.spyOn(sysUserFormService, 'getSysUser').mockReturnValue({ id: null });
      jest.spyOn(sysUserService, 'create').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ sysUser: null });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: sysUser }));
      saveSubject.complete();

      // THEN
      expect(sysUserFormService.getSysUser).toHaveBeenCalled();
      expect(sysUserService.create).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).toHaveBeenCalled();
    });

    it('Should set isSaving to false on error', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<ISysUser>>();
      const sysUser = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
      jest.spyOn(sysUserService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ sysUser });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.error('This is an error!');

      // THEN
      expect(sysUserService.update).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).not.toHaveBeenCalled();
    });
  });

  describe('Compare relationships', () => {
    describe('compareSysRole', () => {
      it('Should forward to sysRoleService', () => {
        const entity = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
        const entity2 = { id: '1361f429-3817-4123-8ee3-fdf8943310b2' };
        jest.spyOn(sysRoleService, 'compareSysRole');
        comp.compareSysRole(entity, entity2);
        expect(sysRoleService.compareSysRole).toHaveBeenCalledWith(entity, entity2);
      });
    });
  });
});
