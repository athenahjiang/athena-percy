-- benefits
SELECT track.date_of_service, benefits.benefits::text
FROM anet_eligibility_track AS track
LEFT JOIN eligibility_request AS request
ON (request.context_id = track.context_id
AND request.eligibility_track_id = track.eligibility_track_id)
INNER JOIN anet_eligibility_benefits AS benefits
ON track.id = benefits.anet_eligibility_track_id
WHERE track.context_id=94 
AND track.patient_id=857448 
AND 1226266 IN (track.patient_insurance_id,request.patientinsurance_id)
AND track.eligibility_track_id=26375248
AND benefits.service_type_code in ('30')
;

-- benefits for mr stc
WITH ranked_benefits AS (
SELECT 
benefits.service_type_code, benefits.benefits::text, track.date_of_service,
ROW_NUMBER() OVER (
PARTITION BY benefits.service_type_code 
ORDER BY track.date_of_service DESC
) AS rank
FROM anet_eligibility_track AS track
LEFT JOIN eligibility_request AS request
ON (request.context_id = track.context_id
AND request.eligibility_track_id = track.eligibility_track_id)
INNER JOIN anet_eligibility_benefits AS benefits
ON track.id = benefits.anet_eligibility_track_id
WHERE track.context_id=94 
AND track.patient_id=857448 
AND 1226266 IN (track.patient_insurance_id,request.patientinsurance_id)
) SELECT service_type_code,benefits,date_of_service
FROM ranked_benefits WHERE rank=1
;