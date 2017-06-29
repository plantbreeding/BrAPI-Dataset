#!/bin/sh

# Start postgres using official docker entrypoint
( /docker-entrypoint.sh postgres; ) &

log() {
  echo "[INFO] $@"
}
wait_for_pg() {
  sleep 2
  until ( psql -U postgres -v ON_ERROR_STOP=1 -c "select version()" | grep -q 'PostgreSQL'; )
    do sleep 2
    log "Waiting for postgres to be ready..."
  done
}

# Copy pgpass to home
ln -sf /brapi-dataset/docker/postgres/.pgpass $HOME/.pgpass
chmod 600 $HOME/.pgpass

# Copy scripts
ln -sf /brapi-dataset/docker/postgres/*.sh /

# Wait for postgres to be ready...
wait_for_pg

log "Restoring database schema..."
/import-schema.sh

log "Restoring database data..."
/import-data.sh

log "Wait for postgres server to shutdown..."
wait
