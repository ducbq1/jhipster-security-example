import { TestBed } from '@angular/core/testing';

import { sampleWithRequiredData, sampleWithNewData } from '../sys-role.test-samples';

import { SysRoleFormService } from './sys-role-form.service';

describe('SysRole Form Service', () => {
  let service: SysRoleFormService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SysRoleFormService);
  });

  describe('Service methods', () => {
    describe('createSysRoleFormGroup', () => {
      it('should create a new form with FormControl', () => {
        const formGroup = service.createSysRoleFormGroup();

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            roleName: expect.any(Object),
            roleCode: expect.any(Object),
            description: expect.any(Object),
            createBy: expect.any(Object),
            createTime: expect.any(Object),
            updateBy: expect.any(Object),
            updateTime: expect.any(Object),
            ids: expect.any(Object),
          })
        );
      });

      it('passing ISysRole should create a new form with FormGroup', () => {
        const formGroup = service.createSysRoleFormGroup(sampleWithRequiredData);

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            roleName: expect.any(Object),
            roleCode: expect.any(Object),
            description: expect.any(Object),
            createBy: expect.any(Object),
            createTime: expect.any(Object),
            updateBy: expect.any(Object),
            updateTime: expect.any(Object),
            ids: expect.any(Object),
          })
        );
      });
    });

    describe('getSysRole', () => {
      it('should return NewSysRole for default SysRole initial value', () => {
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        const formGroup = service.createSysRoleFormGroup(sampleWithNewData);

        const sysRole = service.getSysRole(formGroup) as any;

        expect(sysRole).toMatchObject(sampleWithNewData);
      });

      it('should return NewSysRole for empty SysRole initial value', () => {
        const formGroup = service.createSysRoleFormGroup();

        const sysRole = service.getSysRole(formGroup) as any;

        expect(sysRole).toMatchObject({});
      });

      it('should return ISysRole', () => {
        const formGroup = service.createSysRoleFormGroup(sampleWithRequiredData);

        const sysRole = service.getSysRole(formGroup) as any;

        expect(sysRole).toMatchObject(sampleWithRequiredData);
      });
    });

    describe('resetForm', () => {
      it('passing ISysRole should not enable id FormControl', () => {
        const formGroup = service.createSysRoleFormGroup();
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, sampleWithRequiredData);

        expect(formGroup.controls.id.disabled).toBe(true);
      });

      it('passing NewSysRole should disable id FormControl', () => {
        const formGroup = service.createSysRoleFormGroup(sampleWithRequiredData);
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, { id: null });

        expect(formGroup.controls.id.disabled).toBe(true);
      });
    });
  });
});
