create table INSURANCEPACKAGE
(
    ID                 varchar2(50),
    NAME               varchar2(50),
    NONINSURANCETYPEID varchar2(50)
)
;

create table NONINSURANCETYPE
(
    ID   varchar2(50),
    NAME varchar2(50)
)
;

-- get patient with only standard policies
select PATIENTINSURANCE.PATIENTID
from PATIENTINSURANCE
where PATIENTINSURANCE.SEQUENCENUMBER is not null
  and ELIGIBLEYN = 'Y'
order by PATIENTINSURANCE.CREATED DESC
    fetch first 10 rows only
;

-- get patient with case and/or reference policies
select PATIENTINSURANCE.PATIENTID,
       NONINSURANCETYPE.NAME
from PATIENTINSURANCE
         inner join INSURANCEPACKAGE on INSURANCEPACKAGE.ID = PATIENTINSURANCE.INSURANCEPACKAGEID
         inner join NONINSURANCETYPE on NONINSURANCETYPE.ID = INSURANCEPACKAGE.NONINSURANCETYPEID
where PATIENTINSURANCE.SEQUENCENUMBER is null
order by PATIENTINSURANCE.CREATED DESC
    fetch first 10 rows only
;