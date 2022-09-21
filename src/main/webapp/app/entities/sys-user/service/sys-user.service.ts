import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import dayjs from 'dayjs/esm';

import { isPresent } from 'app/core/util/operators';
import { ApplicationConfigService } from 'app/core/config/application-config.service';
import { createRequestOption } from 'app/core/request/request-util';
import { ISysUser, NewSysUser } from '../sys-user.model';

export type PartialUpdateSysUser = Partial<ISysUser> & Pick<ISysUser, 'id'>;

type RestOf<T extends ISysUser | NewSysUser> = Omit<T, 'birthday' | 'createTime' | 'updateTime'> & {
  birthday?: string | null;
  createTime?: string | null;
  updateTime?: string | null;
};

export type RestSysUser = RestOf<ISysUser>;

export type NewRestSysUser = RestOf<NewSysUser>;

export type PartialUpdateRestSysUser = RestOf<PartialUpdateSysUser>;

export type EntityResponseType = HttpResponse<ISysUser>;
export type EntityArrayResponseType = HttpResponse<ISysUser[]>;

@Injectable({ providedIn: 'root' })
export class SysUserService {
  protected resourceUrl = this.applicationConfigService.getEndpointFor('api/sys-users');

  constructor(protected http: HttpClient, protected applicationConfigService: ApplicationConfigService) {}

  create(sysUser: NewSysUser): Observable<EntityResponseType> {
    const copy = this.convertDateFromClient(sysUser);
    return this.http
      .post<RestSysUser>(this.resourceUrl, copy, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  update(sysUser: ISysUser): Observable<EntityResponseType> {
    const copy = this.convertDateFromClient(sysUser);
    return this.http
      .put<RestSysUser>(`${this.resourceUrl}/${this.getSysUserIdentifier(sysUser)}`, copy, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  partialUpdate(sysUser: PartialUpdateSysUser): Observable<EntityResponseType> {
    const copy = this.convertDateFromClient(sysUser);
    return this.http
      .patch<RestSysUser>(`${this.resourceUrl}/${this.getSysUserIdentifier(sysUser)}`, copy, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  find(id: string): Observable<EntityResponseType> {
    return this.http
      .get<RestSysUser>(`${this.resourceUrl}/${id}`, { observe: 'response' })
      .pipe(map(res => this.convertResponseFromServer(res)));
  }

  query(req?: any): Observable<EntityArrayResponseType> {
    const options = createRequestOption(req);
    return this.http
      .get<RestSysUser[]>(this.resourceUrl, { params: options, observe: 'response' })
      .pipe(map(res => this.convertResponseArrayFromServer(res)));
  }

  delete(id: string): Observable<HttpResponse<{}>> {
    return this.http.delete(`${this.resourceUrl}/${id}`, { observe: 'response' });
  }

  getSysUserIdentifier(sysUser: Pick<ISysUser, 'id'>): string {
    return sysUser.id;
  }

  compareSysUser(o1: Pick<ISysUser, 'id'> | null, o2: Pick<ISysUser, 'id'> | null): boolean {
    return o1 && o2 ? this.getSysUserIdentifier(o1) === this.getSysUserIdentifier(o2) : o1 === o2;
  }

  addSysUserToCollectionIfMissing<Type extends Pick<ISysUser, 'id'>>(
    sysUserCollection: Type[],
    ...sysUsersToCheck: (Type | null | undefined)[]
  ): Type[] {
    const sysUsers: Type[] = sysUsersToCheck.filter(isPresent);
    if (sysUsers.length > 0) {
      const sysUserCollectionIdentifiers = sysUserCollection.map(sysUserItem => this.getSysUserIdentifier(sysUserItem)!);
      const sysUsersToAdd = sysUsers.filter(sysUserItem => {
        const sysUserIdentifier = this.getSysUserIdentifier(sysUserItem);
        if (sysUserCollectionIdentifiers.includes(sysUserIdentifier)) {
          return false;
        }
        sysUserCollectionIdentifiers.push(sysUserIdentifier);
        return true;
      });
      return [...sysUsersToAdd, ...sysUserCollection];
    }
    return sysUserCollection;
  }

  protected convertDateFromClient<T extends ISysUser | NewSysUser | PartialUpdateSysUser>(sysUser: T): RestOf<T> {
    return {
      ...sysUser,
      birthday: sysUser.birthday?.toJSON() ?? null,
      createTime: sysUser.createTime?.toJSON() ?? null,
      updateTime: sysUser.updateTime?.toJSON() ?? null,
    };
  }

  protected convertDateFromServer(restSysUser: RestSysUser): ISysUser {
    return {
      ...restSysUser,
      birthday: restSysUser.birthday ? dayjs(restSysUser.birthday) : undefined,
      createTime: restSysUser.createTime ? dayjs(restSysUser.createTime) : undefined,
      updateTime: restSysUser.updateTime ? dayjs(restSysUser.updateTime) : undefined,
    };
  }

  protected convertResponseFromServer(res: HttpResponse<RestSysUser>): HttpResponse<ISysUser> {
    return res.clone({
      body: res.body ? this.convertDateFromServer(res.body) : null,
    });
  }

  protected convertResponseArrayFromServer(res: HttpResponse<RestSysUser[]>): HttpResponse<ISysUser[]> {
    return res.clone({
      body: res.body ? res.body.map(item => this.convertDateFromServer(item)) : null,
    });
  }
}
