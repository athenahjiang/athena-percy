create table INSURANCEPACKAGE
(
    ID   int,
    NAME int
)
;

-- from package id
select PATIENTINSURANCE.PATIENTID,
       INSURANCEPACKAGE.NAME,
       PATIENTINSURANCE.SEQUENCENUMBER
from INSURANCEPACKAGE
         inner join PATIENTINSURANCE on PATIENTINSURANCE.INSURANCEPACKAGEID = INSURANCEPACKAGE.ID
where INSURANCEPACKAGE.ID = 982
  and PATIENTINSURANCE.CANCELLED is null
  and PATIENTINSURANCE.DELETED is null
order by PATIENTINSURANCE.CREATED desc
    fetch first 10 rows only
;

-- from package name
select PATIENTINSURANCE.PATIENTID,
       INSURANCEPACKAGE.NAME,
       PATIENTINSURANCE.SEQUENCENUMBER
from INSURANCEPACKAGE
         inner join PATIENTINSURANCE on PATIENTINSURANCE.INSURANCEPACKAGEID = INSURANCEPACKAGE.ID
where INSURANCEPACKAGE.NAME like 'MEDICARE%'
  and PATIENTINSURANCE.CANCELLED is null
  and PATIENTINSURANCE.DELETED is null
order by PATIENTINSURANCE.CREATED desc
    fetch first 10 rows only
;

-- from package name and eligibility status
select PI.PATIENTID, IP.NAME, PI.SEQUENCENUMBER
from INSURANCEPACKAGE IP
         inner join PATIENTINSURANCE PI on PI.INSURANCEPACKAGEID = IP.ID
         inner join ELIGIBILITYTRACK TRACK on TRACK.PATIENTINSURANCEID = PI.ID
where IP.NAME like 'MEDICARE%'
  and TRACK.MESSAGERESULT = '1'
  and PI.CANCELLED is null
  and PI.DELETED is null
order by PI.CREATED desc
    fetch first 10 rows only
;

-- from package id and eligibility status
select PI.PATIENTID, PI.SEQUENCENUMBER
from ELIGIBILITYTRACK TRACK
         inner join PATIENTINSURANCE PI on PI.ID = TRACK.PATIENTINSURANCEID
where TRACK.INSURANCEPACKAGEID = 131462
  and TRACK.MESSAGERESULT = '1'
  and PI.CANCELLED is null
  and PI.DELETED is null
order by PI.CREATED desc
    fetch first 10 rows only
;

-- long package name
select pi.PATIENTID, pi.SEQUENCENUMBER, ip.name
from PATIENTINSURANCE pi
         inner join INSURANCEPACKAGE ip
                    on pi.INSURANCEPACKAGEID = ip.ID
where ip.name like '%MEDICAID REPLACEMENT%'
  and pi.CANCELLED is null
  and pi.DELETED is null
order by length(ip.name) desc
    fetch first 5 rows only
;
