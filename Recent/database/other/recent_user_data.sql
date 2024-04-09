-- noinspection SqlResolveForFile

select key
from recentuserdata
where username = 'pjiang4';

select value
from recentuserdata
where username = 'pjiang4';

-- favorite stc
select username, value
from recentuserdata
where key = 'ELIGIBILITY_FAVORITE_STCCODE';

-- reset favorite stc
update recentuserdata
set value = null
where key = 'ELIGIBILITY_FAVORITE_STCCODE'
  and value = '[]';
