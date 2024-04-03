create table ELIGIBILITYCLASS
(
    ID           varchar2(50),
    NAME         varchar2(20),
    RECEIVERNAME varchar2(20)
)
;

-- get class from receiver
select ID, NAME, RECEIVERNAME
from ELIGIBILITYCLASS
where RECEIVERNAME = 'AVAILITY';

-- get receiver from class
select ID, NAME, RECEIVERNAME
from ELIGIBILITYCLASS
where NAME = 'AETNA';
