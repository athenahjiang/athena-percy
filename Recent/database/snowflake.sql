-- noinspection SqlResolveForFile

--
-- DEV
-- 
-- role: COLL_FDP_DEV_RW
-- warehouse: COLL_FDP_DEV
select count(*)
from MDIP_STAGING.INSURANCE_MANAGEMENT_ELIGSVCDB_PUBLIC_DEV.ELIGIBILITY_REQUEST;
select count(*)
from MDIP_STAGING.INSURANCE_MANAGEMENT_ELIGSVCDB_PUBLIC_DEV.ELIGIBILITY_REQUEST_SERVICE_TYPE_CODE;

-- 
-- PROD
-- 
-- role: COLL_FDP_PROD_RW
-- warehouse: COLL_FDP_PROD
select count(*)
from MDIP_PROD.INSURANCE_MANAGEMENT_ELIGSVCDB_PUBLIC_PROD.ELIGIBILITY_REQUEST;
select count(*)
from MDIP_PROD.INSURANCE_MANAGEMENT_ELIGSVCDB_PUBLIC_PROD.ELIGIBILITY_REQUEST_SERVICE_TYPE_CODE;
