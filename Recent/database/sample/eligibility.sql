-- track message result
select distinct PI.PATIENTID, PI.SEQUENCENUMBER, TRACK.INSURANCEPACKAGEID
from PATIENTINSURANCE PI
         inner join ELIGIBILITYTRACK TRACK on TRACK.PATIENTINSURANCEID = PI.ID
where TRACK.MESSAGERESULT = '1'
  and PI.DELETED is null
  and PI.CANCELLED is null
order by PI.CREATED desc
    fetch first 10 rows only
;