select *
from INFORMATION_SCHEMA.COLUMNS
where table_name = 'pg_replication_slots';

INSERT INTO pg_replication_slots (slot_name, plugin, slot_type, datoid, database, temporary, active,
                                  active_pid, xmin, catalog_xmin, restart_lsn, confirmed_flush_lsn,
                                  wal_status, safe_wal_size)
VALUES ('test_slot_name', 'test_plugin', 'test_slot_type', null, 'test_database', true, true, 1,
        null, null, null, null, 'test_wal_status', 54687);

select count(*)
from pg_replication_slots;

select count(*)
from pg_replication_origin;