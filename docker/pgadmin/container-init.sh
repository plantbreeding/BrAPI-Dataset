#!/bin/sh

export PGPASSWORD=password
PSQL="psql -h postgres -U postgres"
log() {
  echo "[INFO] $@"
}
wait_for_pg() {
  until $PSQL -v ON_ERROR_STOP=1 -c "select version()" &> /dev/null
    do sleep 2
    log "Waiting for postgres to be ready..."
  done
}
wait_for_pg


# Restoring the database on container start
log "Restoring database schema..."
#PGPASSWORD=password pg_dump -h postgres -U postgres postgres -v -c -s -f /brapi-dataset/schema.sql
$PSQL postgres -f /brapi-dataset/schema.sql

log "Restoring database data..."
$PSQL postgres -f /brapi-dataset/import-data.sql

# Starting pgAdmin server
log "Starting pgAdmin..."
python ./usr/local/lib/python2.7/site-packages/pgadmin4/pgAdmin4.py
