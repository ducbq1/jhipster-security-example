import { Component, OnInit } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize, map } from 'rxjs/operators';

import { SysUserFormService, SysUserFormGroup } from './sys-user-form.service';
import { ISysUser } from '../sys-user.model';
import { SysUserService } from '../service/sys-user.service';
import { ISysRole } from 'app/entities/sys-role/sys-role.model';
import { SysRoleService } from 'app/entities/sys-role/service/sys-role.service';

@Component({
  selector: 'jhi-sys-user-update',
  templateUrl: './sys-user-update.component.html',
})
export class SysUserUpdateComponent implements OnInit {
  isSaving = false;
  sysUser: ISysUser | null = null;

  sysRolesSharedCollection: ISysRole[] = [];

  editForm: SysUserFormGroup = this.sysUserFormService.createSysUserFormGroup();

  constructor(
    protected sysUserService: SysUserService,
    protected sysUserFormService: SysUserFormService,
    protected sysRoleService: SysRoleService,
    protected activatedRoute: ActivatedRoute
  ) {}

  compareSysRole = (o1: ISysRole | null, o2: ISysRole | null): boolean => this.sysRoleService.compareSysRole(o1, o2);

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ sysUser }) => {
      this.sysUser = sysUser;
      if (sysUser) {
        this.updateForm(sysUser);
      }

      this.loadRelationshipsOptions();
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const sysUser = this.sysUserFormService.getSysUser(this.editForm);
    if (sysUser.id !== null) {
      this.subscribeToSaveResponse(this.sysUserService.update(sysUser));
    } else {
      this.subscribeToSaveResponse(this.sysUserService.create(sysUser));
    }
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<ISysUser>>): void {
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

  protected updateForm(sysUser: ISysUser): void {
    this.sysUser = sysUser;
    this.sysUserFormService.resetForm(this.editForm, sysUser);

    this.sysRolesSharedCollection = this.sysRoleService.addSysRoleToCollectionIfMissing<ISysRole>(
      this.sysRolesSharedCollection,
      ...(sysUser.ids ?? [])
    );
  }

  protected loadRelationshipsOptions(): void {
    this.sysRoleService
      .query()
      .pipe(map((res: HttpResponse<ISysRole[]>) => res.body ?? []))
      .pipe(
        map((sysRoles: ISysRole[]) => this.sysRoleService.addSysRoleToCollectionIfMissing<ISysRole>(sysRoles, ...(this.sysUser?.ids ?? [])))
      )
      .subscribe((sysRoles: ISysRole[]) => (this.sysRolesSharedCollection = sysRoles));
  }
}
