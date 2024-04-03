# aws
aws-azure-login --profile saml --mode gui

# destroy
# db - disable deletion protection
# db - delete snapshot
# s3 - empty buckets

# jump
ssh jump.us-east-1.dev.922056656510.aws.athenahealth.com
ssh jump.us-west-2.dev.922056656510.aws.athenahealth.com

# rds
ssh -L 5432:eligsvcdb-5cc5a4-dev-eligsvc.cmlaglbozjbo.us-east-1.rds.amazonaws.com:5432 jump.us-east-1.dev.922056656510.aws.athenahealth.com
ssh -L 5432:eligsvcdb-eb92cc-int-eligsvc.cmlaglbozjbo.us-east-1.rds.amazonaws.com:5432 jump.us-east-1.dev.922056656510.aws.athenahealth.com
ssh -L 5432:eligsvcdb-prod-eligsvc.c3jfihid7gkd.us-east-1.rds.amazonaws.com:5432 jump.us-east-1.prod.213397030215.aws.athenahealth.com

# aurora
ssh -L 5432:eligibility-service-aurora-5cc5a4-dev.cluster-cmlaglbozjbo.us-east-1.rds.amazonaws.com:5432 jump.us-east-1.dev.922056656510.aws.athenahealth.com

# psql
docker exec -it eligsvcdb bash
psql -h localhost -d eligsvcdb -U localuser -p 5432
psql --host=eligibility-service-aurora-5cc5a4-dev.cluster-cmlaglbozjbo.us-east-1.rds.amazonaws.com --port=5432 --username=eligibility-service-aurora-5cc5a4-dev_ro_clone --password --dbname=eligsvcdb 

# eligsvcdb
cd ./Documents/eligibility-service/local
docker stop eligsvcdb
docker rm eligsvcdb
docker build -t eligsvcdb .
docker run --detach --name eligsvcdb --publish 5432:5432 --env POSTGRES_DB=eligsvcdb --env POSTGRES_USER=localuser --env POSTGRES_PASSWORD=localpassword -it eligsvcdb

# estimatedb
docker run --detach --name estimatedb --publish 5433:5432 --env POSTGRES_DB=estimatedb --env POSTGRES_USER=localuser --env POSTGRES_PASSWORD=localpassword postgres:14.5

# perforce
create_stream --type task --jiraproject COLTEC --parentstream //anet/pipeline/core/devmain_filtered --streamname coltec_1115_user_favorites
submit_files.pl COLTEC-1115 --runverifycode --runtests

# jwt
$AX_HOME/fhir/fhir create-anet-jwt --username pjiang4 --scopes athena/user/CollectorEligibility.EligibilityService.read,athena/user/CollectorEligibility.EligibilityService.write

# amplitude
perl $P4_HOME/techops/coredev/rolloutoggle/ezrollouttoggle.pl PTEST1 --featurekey 'AMPLITUDE_NEW_URL' --version 'VERSION1' --practice '94'
perl $ATHENA_HOME/scripts/schema/refresh_snapshots.pl --masterroot PTEST1 --tables feature,featureversion,rolloutwave,rolloutwaveuser,rolloutwavecontext
