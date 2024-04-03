-- all received stc
SELECT DISTINCT benefits.service_type_code,
BOOL_AND(benefits.is_empty_benefit) as is_empty_benefit,
MAX(track.date_of_service) as date_of_service
FROM anet_eligibility_track AS track
LEFT JOIN eligibility_request AS request
ON (request.context_id = track.context_id
AND request.eligibility_track_id = track.eligibility_track_id)
INNER JOIN anet_eligibility_benefits AS benefits
ON track.id = benefits.anet_eligibility_track_id
WHERE track.context_id=432
AND track.patient_id=1561458
AND 21424 IN (track.patient_insurance_id,request.patientinsurance_id)
GROUP BY service_type_code
ORDER BY date_of_service
;

-- get mru stc
SELECT
request_stc.service_type_code,
MAX(request.created) as created
FROM eligibility_request_service_type_code AS request_stc
INNER JOIN eligibility_request AS request 
ON request.id = request_stc.eligibility_request_id
WHERE
request.context_id=432 AND
request.user_department_id=4
GROUP BY service_type_code
FETCH FIRST 5 ROWS ONLY
;

-- get requested stc from track id
SELECT DISTINCT request_stc.service_type_code
FROM anet_eligibility_track AS track
INNER JOIN eligibility_request AS request
ON (request.context_id = track.context_id
AND request.eligibility_track_id = track.eligibility_track_id)
INNER JOIN eligibility_request_service_type_code AS request_stc
ON (request_stc.eligibility_request_id = request.id)
WHERE track.eligibility_track_id=70886
;

-- get received stc from track id
SELECT DISTINCT service_type_code
FROM anet_eligibility_track AS track
INNER JOIN anet_eligibility_benefits AS benefits
ON track.id = benefits.anet_eligibility_track_id
WHERE track.eligibility_track_id=26375248
;
