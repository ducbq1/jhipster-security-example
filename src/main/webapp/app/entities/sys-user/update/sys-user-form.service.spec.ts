import { TestBed } from '@angular/core/testing';

import { sampleWithRequiredData, sampleWithNewData } from '../sys-user.test-samples';

import { SysUserFormService } from './sys-user-form.service';

describe('SysUser Form Service', () => {
  let service: SysUserFormService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SysUserFormService);
  });

  describe('Service methods', () => {
    describe('createSysUserFormGroup', () => {
      it('should create a new form with FormControl', () => {
        const formGroup = service.createSysUserFormGroup();

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            username: expect.any(Object),
            realName: expect.any(Object),
            password: expect.any(Object),
            salt: expect.any(Object),
            avatar: expect.any(Object),
            birthday: expect.any(Object),
            sex: expect.any(Object),
            email: expect.any(Object),
            phone: expect.any(Object),
            orgCode: expect.any(Object),
            status: expect.any(Object),
            delFlag: expect.any(Object),
            thirdId: expect.any(Object),
            thirdType: expect.any(Object),
            activitySync: expect.any(Object),
            workNo: expect.any(Object),
            post: expect.any(Object),
            telephone: expect.any(Object),
            createBy: expect.any(Object),
            createTime: expect.any(Object),
            updateBy: expect.any(Object),
            updateTime: expect.any(Object),
            userIdentity: expect.any(Object),
            departIds: expect.any(Object),
            relTenantIds: expect.any(Object),
            clientId: expect.any(Object),
            ids: expect.any(Object),
          })
        );
      });

      it('passing ISysUser should create a new form with FormGroup', () => {
        const formGroup = service.createSysUserFormGroup(sampleWithRequiredData);

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            username: expect.any(Object),
            realName: expect.any(Object),
            password: expect.any(Object),
            salt: expect.any(Object),
            avatar: expect.any(Object),
            birthday: expect.any(Object),
            sex: expect.any(Object),
            email: expect.any(Object),
            phone: expect.any(Object),
            orgCode: expect.any(Object),
            status: expect.any(Object),
            delFlag: expect.any(Object),
            thirdId: expect.any(Object),
            thirdType: expect.any(Object),
            activitySync: expect.any(Object),
            workNo: expect.any(Object),
            post: expect.any(Object),
            telephone: expect.any(Object),
            createBy: expect.any(Object),
            createTime: expect.any(Object),
            updateBy: expect.any(Object),
            updateTime: expect.any(Object),
            userIdentity: expect.any(Object),
            departIds: expect.any(Object),
            relTenantIds: expect.any(Object),
            clientId: expect.any(Object),
            ids: expect.any(Object),
          })
        );
      });
    });

    describe('getSysUser', () => {
      it('should return NewSysUser for default SysUser initial value', () => {
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        const formGroup = service.createSysUserFormGroup(sampleWithNewData);

        const sysUser = service.getSysUser(formGroup) as any;

        expect(sysUser).toMatchObject(sampleWithNewData);
      });

      it('should return NewSysUser for empty SysUser initial value', () => {
        const formGroup = service.createSysUserFormGroup();

        const sysUser = service.getSysUser(formGroup) as any;

        expect(sysUser).toMatchObject({});
      });

      it('should return ISysUser', () => {
        const formGroup = service.createSysUserFormGroup(sampleWithRequiredData);

        const sysUser = service.getSysUser(formGroup) as any;

        expect(sysUser).toMatchObject(sampleWithRequiredData);
      });
    });

    describe('resetForm', () => {
      it('passing ISysUser should not enable id FormControl', () => {
        const formGroup = service.createSysUserFormGroup();
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, sampleWithRequiredData);

        expect(formGroup.controls.id.disabled).toBe(true);
      });

      it('passing NewSysUser should disable id FormControl', () => {
        const formGroup = service.createSysUserFormGroup(sampleWithRequiredData);
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, { id: null });

        expect(formGroup.controls.id.disabled).toBe(true);
      });
    });
  });
});
