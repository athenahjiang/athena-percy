SELECT pgmemento.create_table_audit(
               tablename := 'dental_eligibility',
               schemaname := 'public',
               log_old_data := FALSE,
               log_new_data := TRUE
       );