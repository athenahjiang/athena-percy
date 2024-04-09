select 1;

select *
from flyway_schema_history;

-- tables
select count(*)
from eligibility_request;
select count(*)
from eligibility_request_service_type_code;
select count(*)
from anet_eligibility_track;
select count(*)
from anet_eligibility_benefits;

--
-- information schema
--

select table_name
from INFORMATION_SCHEMA.COLUMNS;

select *
from INFORMATION_SCHEMA.COLUMNS
where table_name like '%eligibility%';

select column_name, data_type
from INFORMATION_SCHEMA.COLUMNS
where table_name = 'anet_eligibility_benefits';
