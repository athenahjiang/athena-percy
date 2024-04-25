select * from row_log;
select * from table_event_log;
select * from transaction_log;

SELECT table_event_log.stmt_time, table_event_log.table_operation, row_log.old_data
FROM table_event_log INNER JOIN row_log ON row_log.event_key = table_event_log.event_key
WHERE row_log.audit_id = 1
ORDER BY table_event_log.op_id
;
