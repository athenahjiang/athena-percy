-- from status
select ID,
       PATIENTID
from APPOINTMENT
where STATUS = 'f'
  and STARTCHECKIN is not null
order by CREATED desc fetch first 10 rows only;
