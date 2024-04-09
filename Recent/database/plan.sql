explain analyze
SELECT (SELECT STRING_AGG(distinct service_type_code, ',') requested_stcs
        FROM eligibility_request_service_type_code
        WHERE eligibility_request_id = request.id),
       track.eligibility_track_id,
       track.provider_id,
       track.subscriber_id,
       track.date_of_service,
       track.inquiry_reason,
       track.result_code,
       track.date_of_inquiry,
       track.checked_by,
       track.other_entities::text
FROM anet_eligibility_track AS track
         LEFT JOIN eligibility_request AS request
                   ON (request.context_id = track.context_id
                       AND request.eligibility_track_id = track.eligibility_track_id)
WHERE track.context_id = 1884
  AND track.patient_id = 61432
  AND 286499 IN (track.patient_insurance_id, request.patientinsurance_id)
  AND track.eligibility_track_id = 1805442;