DROP TABLE eligibility_track;

CREATE TABLE IF NOT EXISTS eligibility_track
(
    -- keys
    id                   BIGSERIAL,
    eligibility_track_id BIGINT                   NOT NULL,
    context_id           BIGINT                   NOT NULL,
    patient_id           BIGINT                   NOT NULL,
    patient_insurance_id BIGINT                   NULL,
    provider_id          BIGINT                   NULL,
    provider_name        VARCHAR(50)              NULL,
    subscriber_id        VARCHAR(25)              NULL,
    -- data
    eligibility_class    VARCHAR(50)              NULL,
    eligibility_receiver VARCHAR(50)              NULL,
    inquiry_reason       VARCHAR(20)              NULL,
    checked_by           VARCHAR(20)              NULL,
    date_of_inquiry      TIMESTAMP WITH TIME ZONE NULL,
    date_of_service      TIMESTAMP WITH TIME ZONE NULL,
    result_code          VARCHAR(5),
    benefits_version      VARCHAR(5)               NULL,
    -- metadata
    created              TIMESTAMP WITH TIME ZONE DEFAULT LOCALTIMESTAMP,
    created_by           VARCHAR(20),
    deleted              TIMESTAMP WITH TIME ZONE NULL,
    deleted_by           VARCHAR(20)              NULL,
    last_modified        TIMESTAMP WITH TIME ZONE DEFAULT LOCALTIMESTAMP,
    last_modified_by     VARCHAR(20)              NULL,
    -- constraints
    PRIMARY KEY (id),
    UNIQUE (context_id, eligibility_track_id)
);

create index idx_eligibility_track_ctx on eligibility_track (context_id);
create index idx_eligibility_track_patient on eligibility_track (patient_id);
create index idx_eligibility_track_pi on eligibility_track (patient_insurance_id);
create index idx_eligibility_track_ctx_patient_pi on eligibility_track (context_id, patient_id, patient_insurance_id);
create index if not exists idx_eligibility_track_et on eligibility_track (eligibility_track_id);

INSERT INTO eligibility_track
(context_id, patient_id, patient_insurance_id, eligibility_track_id, provider_id, provider_name,
 subscriber_id, eligibility_class, eligibility_receiver, inquiry_reason, checked_by,
 date_of_inquiry, date_of_service, result_code, benefits_version, created_by)
VALUES (432, 1561457, 21423, 79898, 397, 'lmccoy52', '115944236', 'UHC', 'UHC_VPN',
        'Upcoming appointment', 'Automatic', null, null, '2', '5', 'pjiang4')
ON CONFLICT (context_id, eligibility_track_id)
    DO UPDATE SET patient_id           = EXCLUDED.patient_id,
                  patient_insurance_id = EXCLUDED.patient_insurance_id,
                  provider_id          = EXCLUDED.provider_id,
                  provider_name        = EXCLUDED.provider_name,
                  subscriber_id        = EXCLUDED.subscriber_id,
                  eligibility_class    = EXCLUDED.eligibility_class,
                  eligibility_receiver = EXCLUDED.eligibility_receiver,
                  inquiry_reason       = EXCLUDED.inquiry_reason,
                  checked_by           = EXCLUDED.checked_by,
                  date_of_inquiry      = EXCLUDED.date_of_inquiry,
                  date_of_service      = EXCLUDED.date_of_service,
                  result_code          = EXCLUDED.result_code,
                  benefits_version      = EXCLUDED.benefits_version,
                  last_modified_by     = EXCLUDED.created_by;

select *
from eligibility_track;
