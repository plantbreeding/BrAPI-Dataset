#!/bin/sh

export PGPASSWORD=password
log() {
  echo "[INFO] $@"
}
wait_for_pg() {
  until psql -h postgres -U postgres postgres -v ON_ERROR_STOP=1 -c "select version()" &> /dev/null
    do sleep 2
    log "Waiting for postgres to be ready..."
  done
}
wait_for_pg

# Restoring the database on container start
log "Restoring database schema..."
/pgadmin/import-schema.sh

log "Restoring database data..."
/pgadmin/import-data.sh

# Starting pgAdmin server
log "Starting pgAdmin..."
python ./usr/local/lib/python2.7/site-packages/pgadmin4/pgAdmin4.py
