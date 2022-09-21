import { Injectable } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { Resolve, ActivatedRouteSnapshot, Router } from '@angular/router';
import { Observable, of, EMPTY } from 'rxjs';
import { mergeMap } from 'rxjs/operators';

import { ISysUser } from '../sys-user.model';
import { SysUserService } from '../service/sys-user.service';

@Injectable({ providedIn: 'root' })
export class SysUserRoutingResolveService implements Resolve<ISysUser | null> {
  constructor(protected service: SysUserService, protected router: Router) {}

  resolve(route: ActivatedRouteSnapshot): Observable<ISysUser | null | never> {
    const id = route.params['id'];
    if (id) {
      return this.service.find(id).pipe(
        mergeMap((sysUser: HttpResponse<ISysUser>) => {
          if (sysUser.body) {
            return of(sysUser.body);
          } else {
            this.router.navigate(['404']);
            return EMPTY;
          }
        })
      );
    }
    return of(null);
  }
}
