import { Injectable } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';

import dayjs from 'dayjs/esm';
import { DATE_TIME_FORMAT } from 'app/config/input.constants';
import { ISysUser, NewSysUser } from '../sys-user.model';

/**
 * A partial Type with required key is used as form input.
 */
type PartialWithRequiredKeyOf<T extends { id: unknown }> = Partial<Omit<T, 'id'>> & { id: T['id'] };

/**
 * Type for createFormGroup and resetForm argument.
 * It accepts ISysUser for edit and NewSysUserFormGroupInput for create.
 */
type SysUserFormGroupInput = ISysUser | PartialWithRequiredKeyOf<NewSysUser>;

/**
 * Type that converts some properties for forms.
 */
type FormValueOf<T extends ISysUser | NewSysUser> = Omit<T, 'birthday' | 'createTime' | 'updateTime'> & {
  birthday?: string | null;
  createTime?: string | null;
  updateTime?: string | null;
};

type SysUserFormRawValue = FormValueOf<ISysUser>;

type NewSysUserFormRawValue = FormValueOf<NewSysUser>;

type SysUserFormDefaults = Pick<NewSysUser, 'id' | 'birthday' | 'sex' | 'createTime' | 'updateTime' | 'ids'>;

type SysUserFormGroupContent = {
  id: FormControl<SysUserFormRawValue['id'] | NewSysUser['id']>;
  username: FormControl<SysUserFormRawValue['username']>;
  realName: FormControl<SysUserFormRawValue['realName']>;
  password: FormControl<SysUserFormRawValue['password']>;
  salt: FormControl<SysUserFormRawValue['salt']>;
  avatar: FormControl<SysUserFormRawValue['avatar']>;
  birthday: FormControl<SysUserFormRawValue['birthday']>;
  sex: FormControl<SysUserFormRawValue['sex']>;
  email: FormControl<SysUserFormRawValue['email']>;
  phone: FormControl<SysUserFormRawValue['phone']>;
  orgCode: FormControl<SysUserFormRawValue['orgCode']>;
  status: FormControl<SysUserFormRawValue['status']>;
  delFlag: FormControl<SysUserFormRawValue['delFlag']>;
  thirdId: FormControl<SysUserFormRawValue['thirdId']>;
  thirdType: FormControl<SysUserFormRawValue['thirdType']>;
  activitySync: FormControl<SysUserFormRawValue['activitySync']>;
  workNo: FormControl<SysUserFormRawValue['workNo']>;
  post: FormControl<SysUserFormRawValue['post']>;
  telephone: FormControl<SysUserFormRawValue['telephone']>;
  createBy: FormControl<SysUserFormRawValue['createBy']>;
  createTime: FormControl<SysUserFormRawValue['createTime']>;
  updateBy: FormControl<SysUserFormRawValue['updateBy']>;
  updateTime: FormControl<SysUserFormRawValue['updateTime']>;
  userIdentity: FormControl<SysUserFormRawValue['userIdentity']>;
  departIds: FormControl<SysUserFormRawValue['departIds']>;
  relTenantIds: FormControl<SysUserFormRawValue['relTenantIds']>;
  clientId: FormControl<SysUserFormRawValue['clientId']>;
  ids: FormControl<SysUserFormRawValue['ids']>;
};

export type SysUserFormGroup = FormGroup<SysUserFormGroupContent>;

@Injectable({ providedIn: 'root' })
export class SysUserFormService {
  createSysUserFormGroup(sysUser: SysUserFormGroupInput = { id: null }): SysUserFormGroup {
    const sysUserRawValue = this.convertSysUserToSysUserRawValue({
      ...this.getFormDefaults(),
      ...sysUser,
    });
    return new FormGroup<SysUserFormGroupContent>({
      id: new FormControl(
        { value: sysUserRawValue.id, disabled: true },
        {
          nonNullable: true,
          validators: [Validators.required],
        }
      ),
      username: new FormControl(sysUserRawValue.username, {
        validators: [Validators.maxLength(100)],
      }),
      realName: new FormControl(sysUserRawValue.realName, {
        validators: [Validators.maxLength(100)],
      }),
      password: new FormControl(sysUserRawValue.password, {
        validators: [Validators.maxLength(255)],
      }),
      salt: new FormControl(sysUserRawValue.salt, {
        validators: [Validators.maxLength(45)],
      }),
      avatar: new FormControl(sysUserRawValue.avatar, {
        validators: [Validators.maxLength(255)],
      }),
      birthday: new FormControl(sysUserRawValue.birthday),
      sex: new FormControl(sysUserRawValue.sex),
      email: new FormControl(sysUserRawValue.email, {
        validators: [Validators.maxLength(45)],
      }),
      phone: new FormControl(sysUserRawValue.phone, {
        validators: [Validators.maxLength(45)],
      }),
      orgCode: new FormControl(sysUserRawValue.orgCode, {
        validators: [Validators.maxLength(64)],
      }),
      status: new FormControl(sysUserRawValue.status),
      delFlag: new FormControl(sysUserRawValue.delFlag),
      thirdId: new FormControl(sysUserRawValue.thirdId, {
        validators: [Validators.maxLength(100)],
      }),
      thirdType: new FormControl(sysUserRawValue.thirdType, {
        validators: [Validators.maxLength(100)],
      }),
      activitySync: new FormControl(sysUserRawValue.activitySync),
      workNo: new FormControl(sysUserRawValue.workNo, {
        validators: [Validators.maxLength(100)],
      }),
      post: new FormControl(sysUserRawValue.post, {
        validators: [Validators.maxLength(100)],
      }),
      telephone: new FormControl(sysUserRawValue.telephone, {
        validators: [Validators.maxLength(45)],
      }),
      createBy: new FormControl(sysUserRawValue.createBy, {
        validators: [Validators.maxLength(32)],
      }),
      createTime: new FormControl(sysUserRawValue.createTime),
      updateBy: new FormControl(sysUserRawValue.updateBy, {
        validators: [Validators.maxLength(32)],
      }),
      updateTime: new FormControl(sysUserRawValue.updateTime),
      userIdentity: new FormControl(sysUserRawValue.userIdentity),
      departIds: new FormControl(sysUserRawValue.departIds),
      relTenantIds: new FormControl(sysUserRawValue.relTenantIds, {
        validators: [Validators.maxLength(100)],
      }),
      clientId: new FormControl(sysUserRawValue.clientId, {
        validators: [Validators.maxLength(64)],
      }),
      ids: new FormControl(sysUserRawValue.ids ?? []),
    });
  }

  getSysUser(form: SysUserFormGroup): ISysUser | NewSysUser {
    return this.convertSysUserRawValueToSysUser(form.getRawValue() as SysUserFormRawValue | NewSysUserFormRawValue);
  }

  resetForm(form: SysUserFormGroup, sysUser: SysUserFormGroupInput): void {
    const sysUserRawValue = this.convertSysUserToSysUserRawValue({ ...this.getFormDefaults(), ...sysUser });
    form.reset(
      {
        ...sysUserRawValue,
        id: { value: sysUserRawValue.id, disabled: true },
      } as any /* cast to workaround https://github.com/angular/angular/issues/46458 */
    );
  }

  private getFormDefaults(): SysUserFormDefaults {
    const currentTime = dayjs();

    return {
      id: null,
      birthday: currentTime,
      sex: false,
      createTime: currentTime,
      updateTime: currentTime,
      ids: [],
    };
  }

  private convertSysUserRawValueToSysUser(rawSysUser: SysUserFormRawValue | NewSysUserFormRawValue): ISysUser | NewSysUser {
    return {
      ...rawSysUser,
      birthday: dayjs(rawSysUser.birthday, DATE_TIME_FORMAT),
      createTime: dayjs(rawSysUser.createTime, DATE_TIME_FORMAT),
      updateTime: dayjs(rawSysUser.updateTime, DATE_TIME_FORMAT),
    };
  }

  private convertSysUserToSysUserRawValue(
    sysUser: ISysUser | (Partial<NewSysUser> & SysUserFormDefaults)
  ): SysUserFormRawValue | PartialWithRequiredKeyOf<NewSysUserFormRawValue> {
    return {
      ...sysUser,
      birthday: sysUser.birthday ? sysUser.birthday.format(DATE_TIME_FORMAT) : undefined,
      createTime: sysUser.createTime ? sysUser.createTime.format(DATE_TIME_FORMAT) : undefined,
      updateTime: sysUser.updateTime ? sysUser.updateTime.format(DATE_TIME_FORMAT) : undefined,
      ids: sysUser.ids ?? [],
    };
  }
}
