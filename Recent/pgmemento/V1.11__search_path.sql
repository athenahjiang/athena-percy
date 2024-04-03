select current_database();
select current_setting('search_path');

\echo
\echo 'Introducing pgMemento to search path ...'
alter database eligsvcdb set search_path to "$user", public, pgmemento;
\echo
\echo 'pgMemento setup completed!'
