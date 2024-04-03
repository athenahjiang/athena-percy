####
#### perf test
####
NYTPROF=start=no $AX_HOME/athenax profile --output-dir [target-directory] --tag [file-name] profiler.pl [instance] [context-id]
NYTPROF=start=no $AX_HOME/athenax profile --output-dir /home/hjiang/gitland/perf_test/target --tag fetch_2 /home/hjiang/gitland/perf_test/fetch.pl 34 94
NYTPROF=start=no $AX_HOME/athenax profile --output-dir /home/hjiang/gitland/perf_test/target --tag benefits /home/hjiang/gitland/perf_test/benefits.pl 52 432

####
#### database
####

# tnsping
tnsping `whichdb 432`
dtest1006.athenahealth.com
1521
DTEST52

# prod database: devro.athenahealth.com
# athena1@ptest1: root database schema in prod (important tables)
# master root instance (test/stage databases):
export MASTER_ROOT_INSTANCE=PTEST1
export MASTER_ROOT_INSTANCE=DTEST1
export MASTER_ROOT_INSTANCE=MAINSTG1
export MASTER_ROOT_INSTANCE=CANDSTG1

# whichdb
whichdb 432

# sql++
sql++ 17979
\u athena1@dtest1
\u athena(practice)@ptest(instance)

####
#### harr
####
harr dev
harr dev --corp # for BLSO
harr dev --port-offset 1 # when port is busy
harr dev --env-override RUNWORKUNITSINPROCESS=0 # with worker?
err hjiang_17800 | logcolor
unharr hjiang_17800

####
#### toggle
####

# for dev
$P4_HOME/techops/coredev/rolloutoggle/ezrollouttoggle.pl DTEST1 --practice 94 --featurekey 'COLTEC164_TEMPORARY_STATSD_THROTTLE_ELIG' --version 'ON'

# other envs
perl /usr/local/athena/techops/coredev/rolloutoggle/ezcompletetoggle.pl --toggles COLTEC_CUSTOM_ELIGIBILITY_CHECK --versions ON --devmain --candidate

####
#### coding
####
re.pl 17979
whence from..to path
whence search_string path
whoowns path
locate path

####
#### worker
####
RUNWORKUNITSINPROCESS=0
ISDEVSERVER=Y 
RUNWORKUNITSINPROCESS=0 ISDEVSERVER=Y $ATHENA_HOME/scripts/app/platform/worker.pl --start --nodaemon --conf $HOME/worker.conf

####
#### cron jobs
####

# run cron script
perl $P4_HOME/techops/collector/oneoffscripts/COLTEC_1115_user_favorites_clean.pl DTEST52 ATHENA432

# run cron job
perl $ATHENA_HOME/scripts/crontab/athenacron.pl --jobid Eligibility::LAUNCHER::medlytix_send --onlyinstances DTEST1
perl $ATHENA_HOME/scripts/crontab/athenacronclient.pl --jobid collector::ONETIMEJOBS::20231018::COLTEC_1115_USER_FAVORITES_CLEAN --onlyinstances DTEST52

# dev cron logs
cat /mnt/devweblog100/medlytix_send_bill/medlytix_send_bill_2021_08_26*

# prod cron logs
cat /mnt/weblogs/scribe/cron/cron-medlytix_ftp_send_simple/cron-medlytix_ftp_send_simple-2021-09-28*

####
#### fcc
####
FILECLOUD_CLIENT_SETTINGS=S3_NETAPP_PRODRO /usr/local/athena/prod/scripts/platform/fileroot_client.pl --filename sendcsv/payeriq_070221_000001_000650_insacct.csv --filetype medlytixpayeriq --forcestack 1 --contextid 1 --debug --action get

fcc info /elig/medlytixpayeriq/sendcsv/payeriq_080921_000001_000650_bill.csv
