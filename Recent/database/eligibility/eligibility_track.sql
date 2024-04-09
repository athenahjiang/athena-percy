-- noinspection SqlResolveForFile

--
-- find pi
--

-- find pi with multiple tracks
select patientid, patientinsuranceid, count(*) as count
from ELIGIBILITYTRACK
where patientid is not null
  and patientinsuranceid is not null
  and MESSAGERESULT = '1'
having count(*) <= 30
group by patientid, PATIENTINSURANCEID
order by count desc
    fetch first 10 rows only
;

-- find pi with no tracks
select INS.PATIENTID, INS.ID, INS.SEQUENCENUMBER, PACKAGE.NAME
from PATIENTINSURANCE INS
         left join ELIGIBILITYTRACK TRACK on TRACK.PATIENTINSURANCEID = INS.ID
         inner join INSURANCEPACKAGE PACKAGE on PACKAGE.ID = INS.INSURANCEPACKAGEID
where TRACK.PATIENTINSURANCEID is null
  and INS.CANCELLED is null
  and INS.DELETED is null
  and PACKAGE.NAME = 'UNITED HEALTHCARE'
order by INS.CREATED desc
    fetch first 10 rows only
;

-- find pi with eligible tracks
select distinct PI.PATIENTID, PI.SEQUENCENUMBER, TRACK.INSURANCEPACKAGEID
from PATIENTINSURANCE PI
         inner join ELIGIBILITYTRACK TRACK on TRACK.PATIENTINSURANCEID = PI.ID
where TRACK.MESSAGERESULT = '1'
  and PI.DELETED is null
  and PI.CANCELLED is null
order by PI.CREATED desc
    fetch first 10 rows only
;

--
-- find tracks
--

-- from username
select CREATED,
       ID,
       PATIENTINSURANCEID,
       ALTPATIENTINSURANCEID,
       PATIENTID
from ELIGIBILITYTRACK
where USERNAME = 'pjiang4'
order by CREATED desc
;

-- from patient
select ID,
       STATE,
       MESSAGERESULT,
       ELIGIBLERESULT,
       CREATED,
       USERNAME
from ELIGIBILITYTRACK
where PATIENTID = 1561424
order by CREATED desc
;

-- from pi
select TRACK.ID,
       TRACK.PATIENTINSURANCEID,
       TRACK.ALTPATIENTINSURANCEID,
       TRACK.CREATED,
       TRACK.CREATEDBY
from ELIGIBILITYTRACK TRACK
         left join ALTPATIENTINSURANCE ALTINS on ALTINS.ID = TRACK.ALTPATIENTINSURANCEID
where 21423 in (TRACK.PATIENTINSURANCEID, ALTINS.PATIENTINSURANCEID)
order by TRACK.CREATED desc
;
