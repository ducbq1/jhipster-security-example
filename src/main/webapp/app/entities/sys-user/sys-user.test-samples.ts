import dayjs from 'dayjs/esm';

import { ISysUser, NewSysUser } from './sys-user.model';

export const sampleWithRequiredData: ISysUser = {
  id: '7560aac0-b781-4c2e-9148-f3c9c448c3e6',
};

export const sampleWithPartialData: ISysUser = {
  id: 'adc5dd96-96c7-4c3a-8644-ec8607ce5fb7',
  username: 'Automotive Loan',
  salt: 'benchmark',
  avatar: 'frictionless monitor Card',
  sex: false,
  email: 'Fern.McLaughlin@yahoo.com',
  phone: '1-986-666-5857 x964',
  orgCode: 'killer',
  delFlag: 45347,
  thirdType: 'utilize',
  activitySync: 20507,
  workNo: 'North database District',
  telephone: '(816) 332-9118 x310',
  createTime: dayjs('2022-09-20T05:12'),
  departIds: 'Cotton',
  relTenantIds: 'Generic web-enabled',
  clientId: 'reinvent Industrial',
};

export const sampleWithFullData: ISysUser = {
  id: '32a615ce-3c14-4d1c-8b4c-d5e279c23a86',
  username: 'Krone',
  realName: 'Sausages Croatia',
  password: 'transmitting Kids empower',
  salt: 'Som monitor',
  avatar: 'GB deposit',
  birthday: dayjs('2022-09-20T08:27'),
  sex: true,
  email: 'Josephine.Greenholt88@gmail.com',
  phone: '317-377-7462 x3826',
  orgCode: 'quantifying',
  status: 98772,
  delFlag: 93279,
  thirdId: 'Cotton compelling Florida',
  thirdType: 'Car Administrator',
  activitySync: 5712,
  workNo: 'forecast mobile Computer',
  post: 'matrix',
  telephone: '887.293.5903 x87080',
  createBy: 'input',
  createTime: dayjs('2022-09-20T01:55'),
  updateBy: 'Ergonomic metrics',
  updateTime: dayjs('2022-09-20T09:09'),
  userIdentity: 33915,
  departIds: 'Concrete magnetic Junction',
  relTenantIds: 'compressing Dynamic gold',
  clientId: 'Books Handmade index',
};

export const sampleWithNewData: NewSysUser = {
  id: null,
};

Object.freeze(sampleWithNewData);
Object.freeze(sampleWithRequiredData);
Object.freeze(sampleWithPartialData);
Object.freeze(sampleWithFullData);
