
This folder contains a docker compose configuration used to build a PostgreSQL database from the BrAPI schema (in `schema.sql`) and example dataset (in `data/` folder).

The PostgreSQL container is a standard postgres 9.x server with forwarded port on the host machine.

# Run PostgresSQL server in docker

Requirements:
- docker
- docker-compose

## (Optionnal) Prepare a virtual docker machine

This step is required on some non linux system to run the container in a VM.

```
docker-machine create main
docker-machine start main
eval $(docker-machine env main)
```

## Build & run the container

```
./docker/up.sh
```

Access postgres on localhost:5432 (or $(docker-machine ip main):5432 if running in a docker machine)

## Run a shell inside one of the container

```
./docker/shell.sh postgres # Enters the postgres container's shell
```

## Delete the container & image

```
./docker/purge.sh
```

# Import & Export schema & data in postgres

The schema and data are automatically loaded in database on container startup
but you can reload them using the following commands:

```
# Load tables from schema.sql into database
./docker/exec.sh postgres /import-schema.sh

# Load CSV from data/ into database
./docker/exec.sh postgres /import-data.sh
```

You can also export the database data as JSON using the SQL queries in the
`json-query` folder and with the following command:

```
# Export database entities as JSON (using json-query/*.sql)
./docker/exec.sh postgres /export-json.sh
```
