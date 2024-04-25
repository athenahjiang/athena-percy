####
#### aws destroy
####
# db - disable deletion protection
# db - delete snapshot
# s3 - empty buckets

# psql
docker exec -it eligsvcdb bash
psql -h localhost -d eligsvcdb -U localuser -p 5432

# eligsvcdb
cd ./Documents/eligibility-service/local
docker stop eligsvcdb
docker rm eligsvcdb
docker build -t eligsvcdb .
docker run --detach --name eligsvcdb --publish 5432:5432 --env POSTGRES_DB=eligsvcdb --env POSTGRES_USER=localuser --env POSTGRES_PASSWORD=localpassword -it eligsvcdb

# estimatedb
docker run --detach --name estimatedb --publish 5433:5432 --env POSTGRES_DB=estimatedb --env POSTGRES_USER=localuser --env POSTGRES_PASSWORD=localpassword postgres:14.5

# jwt
$AX_HOME/fhir/fhir create-anet-jwt --username pjiang4 --scopes athena/user/CollectorEligibility.EligibilityService.read,athena/user/CollectorEligibility.EligibilityService.write

# perforce
create_stream --type task --jiraproject COLTEC --parentstream //anet/pipeline/core/devmain_filtered --streamname coltec_1115_user_favorites
submit_files.pl COLTEC-1115 --runverifycode --runtests
