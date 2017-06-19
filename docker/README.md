
This folder contains a docker compose configuration defining two container (postgres and pgadmin) that can be used to build a PostgreSQL database from the BrAPI schema (in `schema.sql`) and example dataset (in `data/` folder).

The PostgreSQL container is a standard postgres 9.4 server with forwarded port on the host machine and the `data/` folder mounted as volume `/data`.
The pgAdmin container is customized to have the postgres-client command line tools with an automatic import of the BrAPI schema and example dataset on container start.

# Run PostgresSQL server & pgAdmin in docker

Requirements:
- docker
- docker-compose

## (Optionnal) Prepare a virtual docker machine

This step is required on some non linux system to run the containers in a VM.

```
docker-machine create main
docker-machine start main
eval $(docker-machine env main)
```

## Build & run

```
./docker/up.sh
```

Access pgAdmin on http://localhost:5050 or http://$(docker-machine ip main):5050 (if running in a docker machine)

## Run a shell inside one of the containers

```
./docker/shell.sh postgres # Enters the postgres container's shell
./docker/shell.sh pgadmin  # Enters the pgadmin container's shell
```

## Delete the containers & images

```
./docker/purge.sh
```

# Import & Export schema & data in postgres

```
# Load tables from schem.sql into database
./docker/exec.sh pgadmin /pgadmin/import-schema.sh

# Dump database without data (in dump.sql next to schema.sql)
# The result SQL file is not as readable as schema.sql
./docker/exec.sh pgadmin /pgadmin/export-schema.sh

# Load CSV from data/ into database
./docker/exec.sh pgadmin /pgadmin/import-data.sh
```
