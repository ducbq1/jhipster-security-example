import { Injectable } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';

import dayjs from 'dayjs/esm';
import { DATE_TIME_FORMAT } from 'app/config/input.constants';
import { ISysRole, NewSysRole } from '../sys-role.model';

/**
 * A partial Type with required key is used as form input.
 */
type PartialWithRequiredKeyOf<T extends { id: unknown }> = Partial<Omit<T, 'id'>> & { id: T['id'] };

/**
 * Type for createFormGroup and resetForm argument.
 * It accepts ISysRole for edit and NewSysRoleFormGroupInput for create.
 */
type SysRoleFormGroupInput = ISysRole | PartialWithRequiredKeyOf<NewSysRole>;

/**
 * Type that converts some properties for forms.
 */
type FormValueOf<T extends ISysRole | NewSysRole> = Omit<T, 'createTime' | 'updateTime'> & {
  createTime?: string | null;
  updateTime?: string | null;
};

type SysRoleFormRawValue = FormValueOf<ISysRole>;

type NewSysRoleFormRawValue = FormValueOf<NewSysRole>;

type SysRoleFormDefaults = Pick<NewSysRole, 'id' | 'createTime' | 'updateTime' | 'ids'>;

type SysRoleFormGroupContent = {
  id: FormControl<SysRoleFormRawValue['id'] | NewSysRole['id']>;
  roleName: FormControl<SysRoleFormRawValue['roleName']>;
  roleCode: FormControl<SysRoleFormRawValue['roleCode']>;
  description: FormControl<SysRoleFormRawValue['description']>;
  createBy: FormControl<SysRoleFormRawValue['createBy']>;
  createTime: FormControl<SysRoleFormRawValue['createTime']>;
  updateBy: FormControl<SysRoleFormRawValue['updateBy']>;
  updateTime: FormControl<SysRoleFormRawValue['updateTime']>;
  ids: FormControl<SysRoleFormRawValue['ids']>;
};

export type SysRoleFormGroup = FormGroup<SysRoleFormGroupContent>;

@Injectable({ providedIn: 'root' })
export class SysRoleFormService {
  createSysRoleFormGroup(sysRole: SysRoleFormGroupInput = { id: null }): SysRoleFormGroup {
    const sysRoleRawValue = this.convertSysRoleToSysRoleRawValue({
      ...this.getFormDefaults(),
      ...sysRole,
    });
    return new FormGroup<SysRoleFormGroupContent>({
      id: new FormControl(
        { value: sysRoleRawValue.id, disabled: true },
        {
          nonNullable: true,
          validators: [Validators.required],
        }
      ),
      roleName: new FormControl(sysRoleRawValue.roleName, {
        validators: [Validators.maxLength(200)],
      }),
      roleCode: new FormControl(sysRoleRawValue.roleCode, {
        validators: [Validators.maxLength(100)],
      }),
      description: new FormControl(sysRoleRawValue.description, {
        validators: [Validators.maxLength(255)],
      }),
      createBy: new FormControl(sysRoleRawValue.createBy, {
        validators: [Validators.maxLength(32)],
      }),
      createTime: new FormControl(sysRoleRawValue.createTime),
      updateBy: new FormControl(sysRoleRawValue.updateBy, {
        validators: [Validators.maxLength(32)],
      }),
      updateTime: new FormControl(sysRoleRawValue.updateTime),
      ids: new FormControl(sysRoleRawValue.ids ?? []),
    });
  }

  getSysRole(form: SysRoleFormGroup): ISysRole | NewSysRole {
    return this.convertSysRoleRawValueToSysRole(form.getRawValue() as SysRoleFormRawValue | NewSysRoleFormRawValue);
  }

  resetForm(form: SysRoleFormGroup, sysRole: SysRoleFormGroupInput): void {
    const sysRoleRawValue = this.convertSysRoleToSysRoleRawValue({ ...this.getFormDefaults(), ...sysRole });
    form.reset(
      {
        ...sysRoleRawValue,
        id: { value: sysRoleRawValue.id, disabled: true },
      } as any /* cast to workaround https://github.com/angular/angular/issues/46458 */
    );
  }

  private getFormDefaults(): SysRoleFormDefaults {
    const currentTime = dayjs();

    return {
      id: null,
      createTime: currentTime,
      updateTime: currentTime,
      ids: [],
    };
  }

  private convertSysRoleRawValueToSysRole(rawSysRole: SysRoleFormRawValue | NewSysRoleFormRawValue): ISysRole | NewSysRole {
    return {
      ...rawSysRole,
      createTime: dayjs(rawSysRole.createTime, DATE_TIME_FORMAT),
      updateTime: dayjs(rawSysRole.updateTime, DATE_TIME_FORMAT),
    };
  }

  private convertSysRoleToSysRoleRawValue(
    sysRole: ISysRole | (Partial<NewSysRole> & SysRoleFormDefaults)
  ): SysRoleFormRawValue | PartialWithRequiredKeyOf<NewSysRoleFormRawValue> {
    return {
      ...sysRole,
      createTime: sysRole.createTime ? sysRole.createTime.format(DATE_TIME_FORMAT) : undefined,
      updateTime: sysRole.updateTime ? sysRole.updateTime.format(DATE_TIME_FORMAT) : undefined,
      ids: sysRole.ids ?? [],
    };
  }
}
