import { NgModule } from '@angular/core';
import { SharedModule } from 'app/shared/shared.module';
import { SysUserComponent } from './list/sys-user.component';
import { SysUserDetailComponent } from './detail/sys-user-detail.component';
import { SysUserUpdateComponent } from './update/sys-user-update.component';
import { SysUserDeleteDialogComponent } from './delete/sys-user-delete-dialog.component';
import { SysUserRoutingModule } from './route/sys-user-routing.module';

@NgModule({
  imports: [SharedModule, SysUserRoutingModule],
  declarations: [SysUserComponent, SysUserDetailComponent, SysUserUpdateComponent, SysUserDeleteDialogComponent],
})
export class SysUserModule {}
