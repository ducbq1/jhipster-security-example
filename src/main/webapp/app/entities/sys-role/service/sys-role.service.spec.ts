import { TestBed } from '@angular/core/testing';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';

import { ISysRole } from '../sys-role.model';
import { sampleWithRequiredData, sampleWithNewData, sampleWithPartialData, sampleWithFullData } from '../sys-role.test-samples';

import { SysRoleService, RestSysRole } from './sys-role.service';

const requireRestSample: RestSysRole = {
  ...sampleWithRequiredData,
  createTime: sampleWithRequiredData.createTime?.toJSON(),
  updateTime: sampleWithRequiredData.updateTime?.toJSON(),
};

describe('SysRole Service', () => {
  let service: SysRoleService;
  let httpMock: HttpTestingController;
  let expectedResult: ISysRole | ISysRole[] | boolean | null;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
    });
    expectedResult = null;
    service = TestBed.inject(SysRoleService);
    httpMock = TestBed.inject(HttpTestingController);
  });

  describe('Service methods', () => {
    it('should find an element', () => {
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.find('9fec3727-3421-4967-b213-ba36557ca194').subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'GET' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should create a SysRole', () => {
      // eslint-disable-next-line @typescript-eslint/no-unused-vars
      const sysRole = { ...sampleWithNewData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.create(sysRole).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'POST' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should update a SysRole', () => {
      const sysRole = { ...sampleWithRequiredData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.update(sysRole).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PUT' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should partial update a SysRole', () => {
      const patchObject = { ...sampleWithPartialData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.partialUpdate(patchObject).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PATCH' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should return a list of SysRole', () => {
      const returnedFromService = { ...requireRestSample };

      const expected = { ...sampleWithRequiredData };

      service.query().subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'GET' });
      req.flush([returnedFromService]);
      httpMock.verify();
      expect(expectedResult).toMatchObject([expected]);
    });

    it('should delete a SysRole', () => {
      const expected = true;

      service.delete('9fec3727-3421-4967-b213-ba36557ca194').subscribe(resp => (expectedResult = resp.ok));

      const req = httpMock.expectOne({ method: 'DELETE' });
      req.flush({ status: 200 });
      expect(expectedResult).toBe(expected);
    });

    describe('addSysRoleToCollectionIfMissing', () => {
      it('should add a SysRole to an empty array', () => {
        const sysRole: ISysRole = sampleWithRequiredData;
        expectedResult = service.addSysRoleToCollectionIfMissing([], sysRole);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(sysRole);
      });

      it('should not add a SysRole to an array that contains it', () => {
        const sysRole: ISysRole = sampleWithRequiredData;
        const sysRoleCollection: ISysRole[] = [
          {
            ...sysRole,
          },
          sampleWithPartialData,
        ];
        expectedResult = service.addSysRoleToCollectionIfMissing(sysRoleCollection, sysRole);
        expect(expectedResult).toHaveLength(2);
      });

      it("should add a SysRole to an array that doesn't contain it", () => {
        const sysRole: ISysRole = sampleWithRequiredData;
        const sysRoleCollection: ISysRole[] = [sampleWithPartialData];
        expectedResult = service.addSysRoleToCollectionIfMissing(sysRoleCollection, sysRole);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(sysRole);
      });

      it('should add only unique SysRole to an array', () => {
        const sysRoleArray: ISysRole[] = [sampleWithRequiredData, sampleWithPartialData, sampleWithFullData];
        const sysRoleCollection: ISysRole[] = [sampleWithRequiredData];
        expectedResult = service.addSysRoleToCollectionIfMissing(sysRoleCollection, ...sysRoleArray);
        expect(expectedResult).toHaveLength(3);
      });

      it('should accept varargs', () => {
        const sysRole: ISysRole = sampleWithRequiredData;
        const sysRole2: ISysRole = sampleWithPartialData;
        expectedResult = service.addSysRoleToCollectionIfMissing([], sysRole, sysRole2);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(sysRole);
        expect(expectedResult).toContain(sysRole2);
      });

      it('should accept null and undefined values', () => {
        const sysRole: ISysRole = sampleWithRequiredData;
        expectedResult = service.addSysRoleToCollectionIfMissing([], null, sysRole, undefined);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(sysRole);
      });

      it('should return initial array if no SysRole is added', () => {
        const sysRoleCollection: ISysRole[] = [sampleWithRequiredData];
        expectedResult = service.addSysRoleToCollectionIfMissing(sysRoleCollection, undefined, null);
        expect(expectedResult).toEqual(sysRoleCollection);
      });
    });

    describe('compareSysRole', () => {
      it('Should return true if both entities are null', () => {
        const entity1 = null;
        const entity2 = null;

        const compareResult = service.compareSysRole(entity1, entity2);

        expect(compareResult).toEqual(true);
      });

      it('Should return false if one entity is null', () => {
        const entity1 = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
        const entity2 = null;

        const compareResult1 = service.compareSysRole(entity1, entity2);
        const compareResult2 = service.compareSysRole(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey differs', () => {
        const entity1 = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
        const entity2 = { id: '1361f429-3817-4123-8ee3-fdf8943310b2' };

        const compareResult1 = service.compareSysRole(entity1, entity2);
        const compareResult2 = service.compareSysRole(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey matches', () => {
        const entity1 = { id: '9fec3727-3421-4967-b213-ba36557ca194' };
        const entity2 = { id: '9fec3727-3421-4967-b213-ba36557ca194' };

        const compareResult1 = service.compareSysRole(entity1, entity2);
        const compareResult2 = service.compareSysRole(entity2, entity1);

        expect(compareResult1).toEqual(true);
        expect(compareResult2).toEqual(true);
      });
    });
  });

  afterEach(() => {
    httpMock.verify();
  });
});
