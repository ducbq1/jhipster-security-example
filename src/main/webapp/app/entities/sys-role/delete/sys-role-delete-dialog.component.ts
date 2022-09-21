import { Component } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

import { ISysRole } from '../sys-role.model';
import { SysRoleService } from '../service/sys-role.service';
import { ITEM_DELETED_EVENT } from 'app/config/navigation.constants';

@Component({
  templateUrl: './sys-role-delete-dialog.component.html',
})
export class SysRoleDeleteDialogComponent {
  sysRole?: ISysRole;

  constructor(protected sysRoleService: SysRoleService, protected activeModal: NgbActiveModal) {}

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: string): void {
    this.sysRoleService.delete(id).subscribe(() => {
      this.activeModal.close(ITEM_DELETED_EVENT);
    });
  }
}
