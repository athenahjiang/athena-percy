-- from track count
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

-- from p
select ID,
       STATE,
       MESSAGERESULT,
       ELIGIBLERESULT,
       CREATED,
       USERNAME
from ELIGIBILITYTRACK
where PATIENTID = 1561424
order by CREATED desc;

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