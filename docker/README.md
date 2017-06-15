
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
./docker/shell.sh pgadmin # Enters the pgadmin container's shell
```

## Delete the containers & images

```
./docker/purge.sh
```
