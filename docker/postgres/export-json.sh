#!/bin/sh

ls /brapi-dataset/json-query/*.sql | while read SQL; do
  JSON_DIR=$(dirname $SQL)
  JSON=$(basename $SQL | sed 's/.sql$/.json/')
  
  echo "Extracting $JSON..."
  psql -A -t -U postgres -f $SQL > $JSON_DIR/$JSON
done
