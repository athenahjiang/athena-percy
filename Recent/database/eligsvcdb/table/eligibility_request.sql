CREATE TABLE IF NOT EXISTS eligibility_request
(
    -- keys
    id                   UUID                     DEFAULT gen_random_uuid(),
    context_id           BIGINT                   NOT NULL,
    patient_id           BIGINT                   NOT NULL,
    patientinsurance_id  BIGINT                   NOT NULL,
    eligibility_track_id BIGINT                   NULL,
    user_department_id   BIGINT                   NULL,
    provider_id          BIGINT                   NULL,
    -- data
    date_of_service      TIMESTAMP WITH TIME ZONE,
    -- metadata
    created              TIMESTAMP WITH TIME ZONE DEFAULT LOCALTIMESTAMP, -- checkedBy
    created_by           VARCHAR(20),                                     -- dateOfInquiry
    deleted              TIMESTAMP WITH TIME ZONE NULL,
    deleted_by           VARCHAR(20)              NULL,
    last_modified        TIMESTAMP WITH TIME ZONE DEFAULT LOCALTIMESTAMP,
    last_modified_by     VARCHAR(20)              NULL,
    -- constraints
    PRIMARY KEY (id)
);
CREATE INDEX idx_elg_req_by_ctx_id ON public.eligibility_request (context_id);
CREATE INDEX idx_elg_req_by_pi_id ON public.eligibility_request (patientinsurance_id);
CREATE INDEX idx_elg_req_by_track_id ON public.eligibility_request (eligibility_track_id);
CREATE INDEX idx_elg_req_by_dpt_id ON public.eligibility_request (user_department_id);