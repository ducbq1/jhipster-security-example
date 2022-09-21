import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { ISysUser } from '../sys-user.model';

@Component({
  selector: 'jhi-sys-user-detail',
  templateUrl: './sys-user-detail.component.html',
})
export class SysUserDetailComponent implements OnInit {
  sysUser: ISysUser | null = null;

  constructor(protected activatedRoute: ActivatedRoute) {}

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ sysUser }) => {
      this.sysUser = sysUser;
    });
  }

  previousState(): void {
    window.history.back();
  }
}
