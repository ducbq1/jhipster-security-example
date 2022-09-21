import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { ISysRole } from '../sys-role.model';

@Component({
  selector: 'jhi-sys-role-detail',
  templateUrl: './sys-role-detail.component.html',
})
export class SysRoleDetailComponent implements OnInit {
  sysRole: ISysRole | null = null;

  constructor(protected activatedRoute: ActivatedRoute) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ sysRole }) => {
      this.sysRole = sysRole;
    });
  }

  previousState(): void {
    window.history.back();
  }
}
