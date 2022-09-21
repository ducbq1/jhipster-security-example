import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpHeaders, HttpResponse } from '@angular/common/http';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { ActivatedRoute } from '@angular/router';
import { RouterTestingModule } from '@angular/router/testing';
import { of } from 'rxjs';

import { SysRoleService } from '../service/sys-role.service';

import { SysRoleComponent } from './sys-role.component';

describe('SysRole Management Component', () => {
  let comp: SysRoleComponent;
  let fixture: ComponentFixture<SysRoleComponent>;
  let service: SysRoleService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [RouterTestingModule.withRoutes([{ path: 'sys-role', component: SysRoleComponent }]), HttpClientTestingModule],
      declarations: [SysRoleComponent],
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
      .overrideTemplate(SysRoleComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(SysRoleComponent);
    comp = fixture.componentInstance;
    service = TestBed.inject(SysRoleService);

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
    expect(comp.sysRoles?.[0]).toEqual(expect.objectContaining({ id: '9fec3727-3421-4967-b213-ba36557ca194' }));
  });

  describe('trackId', () => {
    it('Should forward to sysRoleService', () => {
      const entity = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
      jest.spyOn(service, 'getSysRoleIdentifier');
      const id = comp.trackId(0, entity);
      expect(service.getSysRoleIdentifier).toHaveBeenCalledWith(entity);
      expect(id).toBe(entity.id);
    });
  });
});
