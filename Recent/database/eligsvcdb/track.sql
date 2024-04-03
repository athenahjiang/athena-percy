-- track
explain analyze
SELECT
(
SELECT STRING_AGG(distinct service_type_code, ',') requested_stcs
FROM eligibility_request_service_type_code
WHERE eligibility_request_id = request.id
),
track.eligibility_track_id,track.provider_id,track.subscriber_id,
track.date_of_service,track.inquiry_reason,track.result_code,
track.date_of_inquiry,track.checked_by,
track.other_entities::text
FROM anet_eligibility_track AS track
LEFT JOIN eligibility_request AS request
ON (request.context_id = track.context_id
AND request.eligibility_track_id = track.eligibility_track_id)
WHERE track.context_id=1884
AND track.eligibility_track_id=1805442;
AND track.patient_id=61432
AND 286499 IN (track.patient_insurance_id,request.patientinsurance_id)

-- test
select id, context_id, patient_id, patient_insurance_id, eligibility_track_id, provider_id
from anet_eligibility_track
where checked_by = 'percy';

-- tracks v2
SELECT eligibility_track_id,
       provider_id,
       provider_name,
       subscriber_id,
       eligibility_class,
       eligibility_receiver,
       inquiry_reason,
       checked_by,
       date_of_inquiry,
       date_of_service,
       result_code,
       benefits_version
FROM eligibility_track
WHERE context_id = 432
  AND patient_id = 1561457
  AND patient_insurance_id = 21423
ORDER BY date_of_inquiry DESC FETCH FIRST 30 ROWS ONLY;

-- latest track v2
SELECT eligibility_track_id
FROM eligibility_track
WHERE context_id = 432
  AND patient_id = 1561457
  AND patient_insurance_id = 21423
ORDER BY date_of_inquiry DESC, created DESC
LIMIT 1;

-- dos list v2
SELECT eligibility_track_id, date_of_service, result_code
FROM eligibility_track
WHERE context_id = 432
  AND patient_id = 1561457
  AND patient_insurance_id = 21423
ORDER BY date_of_inquiry DESC, created DESC
LIMIT 30;

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

select context_id, patient_id, patient_insurance_id, eligibility_track_id
from anet_eligibility_track;

-- get most recent track
SELECT track.eligibility_track_id
FROM anet_eligibility_track AS track
         LEFT JOIN eligibility_request AS request
                   ON (request.context_id = track.context_id
                       AND request.eligibility_track_id = track.eligibility_track_id)
WHERE track.context_id = 432
  AND track.patient_id = 1561457
  AND 21423 IN (track.patient_insurance_id, request.patientinsurance_id)
ORDER BY track.date_of_service DESC, track.date_of_inquiry DESC,
         track.created DESC
LIMIT 1
;

-- track
SELECT (SELECT STRING_AGG(DISTINCT service_type_code, ',')
        FROM anet_eligibility_benefits
        WHERE anet_eligibility_track_id = track.id)
           received_stcs,
       (SELECT STRING_AGG(DISTINCT service_type_code, ',')
        FROM eligibility_request_service_type_code
        WHERE eligibility_request_id = request.id)
           requested_stcs,
       track.eligibility_track_id,
       track.provider_id,
       track.subscriber_id,
       track.date_of_service,
       track.inquiry_reason,
       track.result_code,
       track.outgoing_request,
       track.incoming_response,
       track.date_of_inquiry,
       track.checked_by
FROM anet_eligibility_track AS track
         LEFT JOIN eligibility_request AS request
                   ON (request.context_id = track.context_id
                       AND request.eligibility_track_id = track.eligibility_track_id)
WHERE track.context_id = 22591
  AND track.patient_id = 798
  AND 1205 IN (track.patient_insurance_id, request.patientinsurance_id)
ORDER BY track.date_of_inquiry DESC
    FETCH FIRST 30 ROWS ONLY
;

select count(*) from anet_eligibility_track;

select count(distinct patient_id) from anet_eligibility_track where context_id=94;
