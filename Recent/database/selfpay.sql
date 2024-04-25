-- selfpay
select pi.patientid, pi.id as piid
from insurancepackage ip 
inner join patientinsurance pi on pi.insurancepackageid = ip.id
where ip.name='*SELF PAY*'
and pi.cancelled is null
and pi.deleted is null
order by pi.created desc
fetch first 10 rows only
;

-- procedurecode
select fs.name, pc.procedurecode, dfs.departmentid
from procedurecode pc 
inner join procedurefee pf on pf.procedurecode = pc.procedurecode
inner join feeschedule fs on fs.id = pf.feescheduleid
left join departmentfeeschedule dfs on fs.id = dfs.feescheduleid
where fs.name like '%SELF%'
and dfs.departmentid is not null
fetch first 10 rows only
;

-- department
select name from department where id=103;
