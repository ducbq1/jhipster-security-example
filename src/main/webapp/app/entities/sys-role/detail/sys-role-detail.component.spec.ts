import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ActivatedRoute } from '@angular/router';
import { of } from 'rxjs';

import { SysRoleDetailComponent } from './sys-role-detail.component';

describe('SysRole Management Detail Component', () => {
  let comp: SysRoleDetailComponent;
  let fixture: ComponentFixture<SysRoleDetailComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [SysRoleDetailComponent],
      providers: [
        {
          provide: ActivatedRoute,
          useValue: { data: of({ sysRole: { id: '9fec3727-3421-4967-b213-ba36557ca194' } }) },
        },
      ],
    })
      .overrideTemplate(SysRoleDetailComponent, '')
      .compileComponents();
    fixture = TestBed.createComponent(SysRoleDetailComponent);
    comp = fixture.componentInstance;
  });

  describe('OnInit', () => {
    it('Should load sysRole on init', () => {
      // WHEN
      comp.ngOnInit();

      // THEN
      expect(comp.sysRole).toEqual(expect.objectContaining({ id: '9fec3727-3421-4967-b213-ba36557ca194' }));
    });
  });
});
