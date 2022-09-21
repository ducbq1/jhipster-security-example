import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import dayjs from 'dayjs/esm';

import { isPresent } from 'app/core/util/operators';
import { ApplicationConfigService } from 'app/core/config/application-config.service';
import { createRequestOption } from 'app/core/request/request-util';
import { ISysRole, NewSysRole } from '../sys-role.model';

export type PartialUpdateSysRole = Partial<ISysRole> & Pick<ISysRole, 'id'>;

type RestOf<T extends ISysRole | NewSysRole> = Omit<T, 'createTime' | 'updateTime'> & {
  createTime?: string | null;
  updateTime?: string | null;
};

export type RestSysRole = RestOf<ISysRole>;

export type NewRestSysRole = RestOf<NewSysRole>;

export type PartialUpdateRestSysRole = RestOf<PartialUpdateSysRole>;

export type EntityResponseType = HttpResponse<ISysRole>;
export type EntityArrayResponseType = HttpResponse<ISysRole[]>;

@Injectable({ providedIn: 'root' })
export class SysRoleService {
  protected resourceUrl = this.applicationConfigService.getEndpointFor('api/sys-roles');

  constructor(protected http: HttpClient, protected applicationConfigService: ApplicationConfigService) {}

  create(sysRole: NewSysRole): Observable<EntityResponseType> {
    const copy = this.convertDateFromClient(sysRole);
    return this.http
      .post<RestSysRole>(this.resourceUrl, copy, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  update(sysRole: ISysRole): Observable<EntityResponseType> {
    const copy = this.convertDateFromClient(sysRole);
    return this.http
      .put<RestSysRole>(`${this.resourceUrl}/${this.getSysRoleIdentifier(sysRole)}`, copy, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  partialUpdate(sysRole: PartialUpdateSysRole): Observable<EntityResponseType> {
    const copy = this.convertDateFromClient(sysRole);
    return this.http
      .patch<RestSysRole>(`${this.resourceUrl}/${this.getSysRoleIdentifier(sysRole)}`, copy, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  find(id: string): Observable<EntityResponseType> {
    return this.http
      .get<RestSysRole>(`${this.resourceUrl}/${id}`, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  query(req?: any): Observable<EntityArrayResponseType> {
    const options = createRequestOption(req);
    return this.http
      .get<RestSysRole[]>(this.resourceUrl, { params: options, observe: 'response' })
      .pipe(map(res => this.convertResponseArrayFromServer(res)));
  }

  delete(id: string): Observable<HttpResponse<{}>> {
    return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  getSysRoleIdentifier(sysRole: Pick<ISysRole, 'id'>): string {
    return sysRole.id;
  }

  compareSysRole(o1: Pick<ISysRole, 'id'> | null, o2: Pick<ISysRole, 'id'> | null): boolean {
    return o1 && o2 ? this.getSysRoleIdentifier(o1) === this.getSysRoleIdentifier(o2) : o1 === o2;
  }

  addSysRoleToCollectionIfMissing<Type extends Pick<ISysRole, 'id'>>(
    sysRoleCollection: Type[],
    ...sysRolesToCheck: (Type | null | undefined)[]
  ): Type[] {
    const sysRoles: Type[] = sysRolesToCheck.filter(isPresent);
    if (sysRoles.length > 0) {
      const sysRoleCollectionIdentifiers = sysRoleCollection.map(sysRoleItem => this.getSysRoleIdentifier(sysRoleItem)!);
      const sysRolesToAdd = sysRoles.filter(sysRoleItem => {
        const sysRoleIdentifier = this.getSysRoleIdentifier(sysRoleItem);
        if (sysRoleCollectionIdentifiers.includes(sysRoleIdentifier)) {
          return false;
        }
        sysRoleCollectionIdentifiers.push(sysRoleIdentifier);
        return true;
      });
      return [...sysRolesToAdd, ...sysRoleCollection];
    }
    return sysRoleCollection;
  }

  protected convertDateFromClient<T extends ISysRole | NewSysRole | PartialUpdateSysRole>(sysRole: T): RestOf<T> {
    return {
      ...sysRole,
      createTime: sysRole.createTime?.toJSON() ?? null,
      updateTime: sysRole.updateTime?.toJSON() ?? null,
    };
  }

  protected convertDateFromServer(restSysRole: RestSysRole): ISysRole {
    return {
      ...restSysRole,
      createTime: restSysRole.createTime ? dayjs(restSysRole.createTime) : undefined,
      updateTime: restSysRole.updateTime ? dayjs(restSysRole.updateTime) : undefined,
    };
  }

  protected convertResponseFromServer(res: HttpResponse<RestSysRole>): HttpResponse<ISysRole> {
    return res.clone({
      body: res.body ? this.convertDateFromServer(res.body) : null,
    });
  }

  protected convertResponseArrayFromServer(res: HttpResponse<RestSysRole[]>): HttpResponse<ISysRole[]> {
    return res.clone({
      body: res.body ? res.body.map(item => this.convertDateFromServer(item)) : null,
    });
  }
}
