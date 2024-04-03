select key from recentuserdata where username='pjiang4';
select value from recentuserdata where username='pjiang4';

select username,value from recentuserdata where key='ELIGIBILITY_FAVORITE_STCCODE';

update recentuserdata set value = null where key='ELIGIBILITY_FAVORITE_STCCODE' and value = '[]';
