#!/bin/sh

JSON_DIR=/brapi-dataset/data/json
rm -f $JSON_DIR/*.json

ls /brapi-dataset/json-query/*.sql | while read SQL; do
  JSON=$(basename $SQL | sed 's/.sql$/.json/')

  echo "Extracting $JSON..."
  psql -A -t -U postgres -f $SQL > $JSON_DIR/$JSON
done
