-- get custom tracks
select eligibility_track_id
from anet_eligibility_track
where context_id = 94
  and patient_id = 857448
  and patient_insurance_id is null
;

-- get generic tracks
select eligibility_track_id
from anet_eligibility_track
where context_id = 432
  and patient_id = 859386
  and patient_insurance_id = 22326
;

-- test load
select count(distinct patient_id)
from anet_eligibility_track
where context_id = 94;
select count(distinct patient_insurance_id)
from anet_eligibility_track
where context_id = 94;
