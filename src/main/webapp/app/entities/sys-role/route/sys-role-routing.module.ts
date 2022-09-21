import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { UserRouteAccessService } from 'app/core/auth/user-route-access.service';
import { SysRoleComponent } from '../list/sys-role.component';
import { SysRoleDetailComponent } from '../detail/sys-role-detail.component';
import { SysRoleUpdateComponent } from '../update/sys-role-update.component';
import { SysRoleRoutingResolveService } from './sys-role-routing-resolve.service';
import { ASC } from 'app/config/navigation.constants';

const sysRoleRoute: Routes = [
  {
    path: '',
    component: SysRoleComponent,
    data: {
      defaultSort: 'id,' + ASC,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/view',
    component: SysRoleDetailComponent,
    resolve: {
      sysRole: SysRoleRoutingResolveService,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: 'new',
    component: SysRoleUpdateComponent,
    resolve: {
      sysRole: SysRoleRoutingResolveService,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/edit',
    component: SysRoleUpdateComponent,
    resolve: {
      sysRole: SysRoleRoutingResolveService,
    },
    canActivate: [UserRouteAccessService],
  },
];

@NgModule({
  imports: [RouterModule.forChild(sysRoleRoute)],
  exports: [RouterModule],
})
export class SysRoleRoutingModule {}
