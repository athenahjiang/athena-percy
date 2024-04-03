####
#### psql container
####

# remove
docker stop eligsvcdb
docker rm eligsvcdb

# local
docker build -t eligsvcdb .
docker run --detach --name eligsvcdb --publish 5432:5432 --env POSTGRES_DB=eligsvcdb --env POSTGRES_USER=localuser --env POSTGRES_PASSWORD=localpassword -it eligsvcdb

# yml
docker-compose -f start-postgres.yml up

# plain
docker run --detach --name estimatedb --publish 5433:5432 --env POSTGRES_DB=estimatedb --env POSTGRES_USER=localuser --env POSTGRES_PASSWORD=localpassword postgres:14.5

# exec
docker exec -it eligsvcdb bash
psql -h localhost -d eligsvcdb -U localuser -p 5432

# disable buildkit
export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

####
#### logs
####
sudo docker container ls -a # list all containers
sudo docker ps # list running containers
sudo docker logs (container_id) # log container
sudo docker logs -f (container_id) # tail log container
sudo docker exec -it (container_id) /bin/bash

####
#### other
####

# compose
# define and run multi-container apps
# read config data from a YAML file
docker-compose -f start-postgres.yml up

# run
# can only start one container at a time
# entirely command line based
docker run --detach --name eligibility_service_postgres --publish 5432:5432 --env POSTGRES_DB=eligibility_service_postgres --env POSTGRES_USER=localuser --env POSTGRES_PASSWORD=localpassword postgres:13.4

# exec
# run a command in a running container
docker exec -it eligibility_service_postgres bash # interactive bash on container

# stop
# stop a container
docker stop eligibility_service_postgres

# rm
# delete a container
docker rm eligibility_service_postgres

# cp
# transfer file between local & container
docker cp local_path/file.csv container_id:/file.csv
docker cp container_id:/file.csv local_path/file.csv
