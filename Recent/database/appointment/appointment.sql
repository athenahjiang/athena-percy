--
-- appointment
--
select ID,
       PATIENTID
from APPOINTMENT
where STATUS = 'f'
  and STARTCHECKIN is not null
order by CREATED desc fetch first 10 rows only;

--
-- fee schedule
-- 
select FS.ID,
       PC.PROCEDURECODE
from FEESCHEDULE FS
         inner join PROCEDUREFEE PF on PF.FEESCHEDULEID = FS.ID
         inner join PROCEDURECODE PC ON PC.PROCEDURECODE = PF.PROCEDURECODE
order by FS.CREATED desc
    fetch first 10 rows only
;
