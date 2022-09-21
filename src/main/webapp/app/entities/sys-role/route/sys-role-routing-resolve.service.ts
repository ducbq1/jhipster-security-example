import { Injectable } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { Resolve, ActivatedRouteSnapshot, Router } from '@angular/router';
import { Observable, of, EMPTY } from 'rxjs';
import { mergeMap } from 'rxjs/operators';

import { ISysRole } from '../sys-role.model';
import { SysRoleService } from '../service/sys-role.service';

@Injectable({ providedIn: 'root' })
export class SysRoleRoutingResolveService implements Resolve<ISysRole | null> {
  constructor(protected service: SysRoleService, protected router: Router) {}

  resolve(route: ActivatedRouteSnapshot): Observable<ISysRole | null | never> {
    const id = route.params['id'];
    if (id) {
      return this.service.find(id).pipe(
        mergeMap((sysRole: HttpResponse<ISysRole>) => {
          if (sysRole.body) {
            return of(sysRole.body);
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
