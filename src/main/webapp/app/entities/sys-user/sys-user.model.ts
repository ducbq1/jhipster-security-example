import dayjs from 'dayjs/esm';
import { ISysRole } from 'app/entities/sys-role/sys-role.model';

export interface ISysUser {
  id: string;
  username?: string | null;
  realName?: string | null;
  password?: string | null;
  salt?: string | null;
  avatar?: string | null;
  birthday?: dayjs.Dayjs | null;
  sex?: boolean | null;
  email?: string | null;
  phone?: string | null;
  orgCode?: string | null;
  status?: number | null;
  delFlag?: number | null;
  thirdId?: string | null;
  thirdType?: string | null;
  activitySync?: number | null;
  workNo?: string | null;
  post?: string | null;
  telephone?: string | null;
  createBy?: string | null;
  createTime?: dayjs.Dayjs | null;
  updateBy?: string | null;
  updateTime?: dayjs.Dayjs | null;
  userIdentity?: number | null;
  departIds?: string | null;
  relTenantIds?: string | null;
  clientId?: string | null;
  ids?: Pick<ISysRole, 'id'>[] | null;
}

export type NewSysUser = Omit<ISysUser, 'id'> & { id: null };
