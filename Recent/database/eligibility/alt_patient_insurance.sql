-- noinspection SqlResolveForFile

-- from pi, get all alt pi
select PI.ID, ALTPI.ID
from PATIENTINSURANCE PI
         inner join ALTPATIENTINSURANCE ALTPI on PI.ID = ALTPI.PATIENTINSURANCEID
where PI.ID = 21424
;

-- from alt pi, get pi
select ID,
       PATIENTINSURANCEID,
       PATIENTID,
       ALTPATIENTID
from ALTPATIENTINSURANCE
where ID = 16417
;

-- from pi, get all generic and custom tracks
select TRACK.ID,
       TRACK.PATIENTINSURANCEID,
       TRACK.ALTPATIENTINSURANCEID
from ELIGIBILITYTRACK TRACK
         left join ALTPATIENTINSURANCE ALTINS on ALTINS.ID = TRACK.ALTPATIENTINSURANCEID
where 21424 in (TRACK.PATIENTINSURANCEID, ALTINS.PATIENTINSURANCEID)
order by TRACK.CREATED desc fetch first 10 rows only
;
