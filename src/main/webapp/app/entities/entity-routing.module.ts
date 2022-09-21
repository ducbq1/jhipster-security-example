import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
  imports: [
    RouterModule.forChild([
      {
        path: 'sys-user',
        data: { pageTitle: 'SysUsers' },
        loadChildren: () => import('./sys-user/sys-user.module').then(m => m.SysUserModule),
      },
      {
        path: 'sys-role',
        data: { pageTitle: 'SysRoles' },
        loadChildren: () => import('./sys-role/sys-role.module').then(m => m.SysRoleModule),
      },
      /* jhipster-needle-add-entity-route - JHipster will add entity modules routes here */
    ]),
  ],
})
export class EntityRoutingModule {}
