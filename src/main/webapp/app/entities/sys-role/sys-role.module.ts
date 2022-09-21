import { NgModule } from '@angular/core';
import { SharedModule } from 'app/shared/shared.module';
import { SysRoleComponent } from './list/sys-role.component';
import { SysRoleDetailComponent } from './detail/sys-role-detail.component';
import { SysRoleUpdateComponent } from './update/sys-role-update.component';
import { SysRoleDeleteDialogComponent } from './delete/sys-role-delete-dialog.component';
import { SysRoleRoutingModule } from './route/sys-role-routing.module';

@NgModule({
  imports: [SharedModule, SysRoleRoutingModule],
  declarations: [SysRoleComponent, SysRoleDetailComponent, SysRoleUpdateComponent, SysRoleDeleteDialogComponent],
})
export class SysRoleModule {}
