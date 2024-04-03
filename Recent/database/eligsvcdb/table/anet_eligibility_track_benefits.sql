CREATE TABLE IF NOT EXISTS anet_eligibility_track
(
    -- keys
    id                   BIGSERIAL,
    eligibility_track_id BIGINT                   NOT NULL,
    context_id           BIGINT                   NOT NULL,
    patient_id           BIGINT                   NOT NULL,
    patient_insurance_id BIGINT                   NULL,
    provider_id          BIGINT                   NULL,
    subscriber_id        VARCHAR(25)              NULL,
    -- data
    inquiry_reason       VARCHAR(20)              NULL,
    checked_by           VARCHAR(20)              NULL,
    date_of_inquiry      TIMESTAMP WITH TIME ZONE NULL,
    date_of_service      TIMESTAMP WITH TIME ZONE NULL,
    result_code          VARCHAR(5),
    outgoing_request     TEXT,
    incoming_response    TEXT,
    other_entities       JSONB                    NULL,
    -- metadata
    created              TIMESTAMP WITH TIME ZONE DEFAULT LOCALTIMESTAMP,
    created_by           VARCHAR(20),
    deleted              TIMESTAMP WITH TIME ZONE NULL,
    deleted_by           VARCHAR(20)              NULL,
    last_modified        TIMESTAMP WITH TIME ZONE DEFAULT LOCALTIMESTAMP,
    last_modified_by     VARCHAR(20)              NULL,
    -- constraints
    PRIMARY KEY (id)
);
CREATE INDEX idx_track_by_ctx_id ON public.anet_eligibility_track (context_id);
CREATE INDEX idx_track_by_p_id ON public.anet_eligibility_track (patient_id);
CREATE INDEX idx_track_by_pi_id ON public.anet_eligibility_track (patient_insurance_id);
CREATE INDEX idx_track_by_track_id ON public.anet_eligibility_track (eligibility_track_id);