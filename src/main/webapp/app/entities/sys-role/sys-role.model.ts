import dayjs from 'dayjs/esm';
import { ISysUser } from 'app/entities/sys-user/sys-user.model';

export interface ISysRole {
  id: string;
  roleName?: string | null;
  roleCode?: string | null;
  description?: string | null;
  createBy?: string | null;
  createTime?: dayjs.Dayjs | null;
  updateBy?: string | null;
  updateTime?: dayjs.Dayjs | null;
  ids?: Pick<ISysUser, 'id'>[] | null;
}

export type NewSysRole = Omit<ISysRole, 'id'> & { id: null };
