import { Component } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

import { ISysUser } from '../sys-user.model';
import { SysUserService } from '../service/sys-user.service';
import { ITEM_DELETED_EVENT } from 'app/config/navigation.constants';

@Component({
  templateUrl: './sys-user-delete-dialog.component.html',
})
export class SysUserDeleteDialogComponent {
  sysUser?: ISysUser;

  constructor(protected sysUserService: SysUserService, protected activeModal: NgbActiveModal) {}

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: string): void {
    this.sysUserService.delete(id).subscribe(() => {
      this.activeModal.close(ITEM_DELETED_EVENT);
    });
  }
}
