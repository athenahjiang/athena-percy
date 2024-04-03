CREATE TABLE IF NOT EXISTS eligibility_request_service_type_code
(
    id                     UUID                     DEFAULT gen_random_uuid(),
    eligibility_request_id UUID                     NOT NULL,
    -- data
    service_type_code      VARCHAR(2)               NOT NULL,
    -- metadata
    created                TIMESTAMP WITH TIME ZONE DEFAULT LOCALTIMESTAMP,
    created_by             VARCHAR(20),
    deleted                TIMESTAMP WITH TIME ZONE NULL,
    deleted_by             VARCHAR(20)              NULL,
    last_modified          TIMESTAMP WITH TIME ZONE NULL,
    last_modified_by       VARCHAR(20)              NULL,
    -- constraints
    PRIMARY KEY (id),
    FOREIGN KEY (eligibility_request_id) REFERENCES public.eligibility_request (id)
);
CREATE INDEX idx_stc_by_req_id ON public.eligibility_request_service_type_code (eligibility_request_id);