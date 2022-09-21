import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize } from 'rxjs/operators';

import { SysRoleFormService, SysRoleFormGroup } from './sys-role-form.service';
import { ISysRole } from '../sys-role.model';
import { SysRoleService } from '../service/sys-role.service';

@Component({
  selector: 'jhi-sys-role-update',
  templateUrl: './sys-role-update.component.html',
})
export class SysRoleUpdateComponent implements OnInit {
  isSaving = false;
  sysRole: ISysRole | null = null;

  editForm: SysRoleFormGroup = this.sysRoleFormService.createSysRoleFormGroup();

  constructor(
    protected sysRoleService: SysRoleService,
    protected sysRoleFormService: SysRoleFormService,
    protected activatedRoute: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ sysRole }) => {
      this.sysRole = sysRole;
      if (sysRole) {
        this.updateForm(sysRole);
      }
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const sysRole = this.sysRoleFormService.getSysRole(this.editForm);
    if (sysRole.id !== null) {
      this.subscribeToSaveResponse(this.sysRoleService.update(sysRole));
    } else {
      this.subscribeToSaveResponse(this.sysRoleService.create(sysRole));
    }
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<ISysRole>>): void {
    result.pipe(finalize(() => this.onSaveFinalize())).subscribe({
      next: () => this.onSaveSuccess(),
      error: () => this.onSaveError(),
    });
  }

  protected onSaveSuccess(): void {
    this.previousState();
  }

  protected onSaveError(): void {
    // Api for inheritance.
  }

  protected onSaveFinalize(): void {
    this.isSaving = false;
  }

  protected updateForm(sysRole: ISysRole): void {
    this.sysRole = sysRole;
    this.sysRoleFormService.resetForm(this.editForm, sysRole);
  }
}
