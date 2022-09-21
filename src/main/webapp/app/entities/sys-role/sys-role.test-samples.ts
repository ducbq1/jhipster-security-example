import dayjs from 'dayjs/esm';

import { ISysRole, NewSysRole } from './sys-role.model';

export const sampleWithRequiredData: ISysRole = {
  id: 'c177f6c2-ce3d-43c9-abe1-53db8ddd7b37',
};

export const sampleWithPartialData: ISysRole = {
  id: '0b0394d8-84ce-4cb0-a056-2d012348daf6',
  roleName: 'Human Integration indexing',
  createBy: 'connecting',
  updateBy: 'Fresh',
};

export const sampleWithFullData: ISysRole = {
  id: '4d78d128-243c-4e75-a53f-898d1c2f7c9a',
  roleName: '5th complexity',
  roleCode: 'zero Reduced',
  description: 'ADP olive Steel',
  createBy: 'Dobra Louisiana Land',
  createTime: dayjs('2022-09-20T13:56'),
  updateBy: 'haptic',
  updateTime: dayjs('2022-09-20T09:06'),
};

export const sampleWithNewData: NewSysRole = {
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
