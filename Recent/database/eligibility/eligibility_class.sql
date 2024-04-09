-- noinspection SqlResolveForFile

-- get class from receiver
select ID, NAME, RECEIVERNAME
from ELIGIBILITYCLASS
where RECEIVERNAME = 'AVAILITY';

-- get receiver from class
select ID, NAME, RECEIVERNAME
from ELIGIBILITYCLASS
where NAME = 'AETNA';
