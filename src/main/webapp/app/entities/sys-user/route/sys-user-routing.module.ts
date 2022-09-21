import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { UserRouteAccessService } from 'app/core/auth/user-route-access.service';
import { SysUserComponent } from '../list/sys-user.component';
import { SysUserDetailComponent } from '../detail/sys-user-detail.component';
import { SysUserUpdateComponent } from '../update/sys-user-update.component';
import { SysUserRoutingResolveService } from './sys-user-routing-resolve.service';
import { ASC } from 'app/config/navigation.constants';

const sysUserRoute: Routes = [
  {
    path: '',
    component: SysUserComponent,
    data: {
      defaultSort: 'id,' + ASC,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/view',
    component: SysUserDetailComponent,
    resolve: {
      sysUser: SysUserRoutingResolveService,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: 'new',
    component: SysUserUpdateComponent,
    resolve: {
      sysUser: SysUserRoutingResolveService,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/edit',
    component: SysUserUpdateComponent,
    resolve: {
      sysUser: SysUserRoutingResolveService,
    },
    canActivate: [UserRouteAccessService],
  },
];

@NgModule({
  imports: [RouterModule.forChild(sysUserRoute)],
  exports: [RouterModule],
})
export class SysUserRoutingModule {}
