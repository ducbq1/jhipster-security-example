import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpHeaders, HttpResponse } from '@angular/common/http';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { ActivatedRoute } from '@angular/router';
import { RouterTestingModule } from '@angular/router/testing';
import { of } from 'rxjs';

import { SysUserService } from '../service/sys-user.service';

import { SysUserComponent } from './sys-user.component';

describe('SysUser Management Component', () => {
  let comp: SysUserComponent;
  let fixture: ComponentFixture<SysUserComponent>;
  let service: SysUserService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [RouterTestingModule.withRoutes([{ path: 'sys-user', component: SysUserComponent }]), HttpClientTestingModule],
      declarations: [SysUserComponent],
      providers: [
        {
          provide: ActivatedRoute,
          useValue: {
            data: of({
              defaultSort: 'id,asc',
            }),
            queryParamMap: of(
              jest.requireActual('@angular/router').convertToParamMap({
                page: '1',
                size: '1',
                sort: 'id,desc',
              })
            ),
            snapshot: { queryParams: {} },
          },
        },
      ],
    })
      .overrideTemplate(SysUserComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(SysUserComponent);
    comp = fixture.componentInstance;
    service = TestBed.inject(SysUserService);

    const headers = new HttpHeaders();
    jest.spyOn(service, 'query').mockReturnValue(
      of(
        new HttpResponse({
          body: [{ id: '9fec3727-3421-4967-b213-ba36557ca194' }],
          headers,
        })
      )
    );
  });

  it('Should call load all on init', () => {
    // WHEN
    comp.ngOnInit();

    // THEN
    expect(service.query).toHaveBeenCalled();
    expect(comp.sysUsers?.[0]).toEqual(expect.objectContaining({ id: '9fec3727-3421-4967-b213-ba36557ca194' }));
  });

  describe('trackId', () => {
    it('Should forward to sysUserService', () => {
      const entity = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
      jest.spyOn(service, 'getSysUserIdentifier');
      const id = comp.trackId(0, entity);
      expect(service.getSysUserIdentifier).toHaveBeenCalledWith(entity);
      expect(id).toBe(entity.id);
    });
  });
});
