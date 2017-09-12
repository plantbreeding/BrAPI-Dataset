#!/bin/sh

# Load list of crops
cat << EOF | psql -U postgres -f -
COPY crop FROM '/brapi-dataset/data/csv/crop.csv' DELIMITER ',' CSV HEADER;
EOF

# List tables in valid insertion order (respecting foreign key restrictions)
TABLE_IN_ORDER="germplasm taxon_xref taxon_xref_germplasm germplasm_attribute_category germplasm_attribute germplasm_attribute_value donor program contact trial trial_additional_info trial_contact location location_additional_info study_type study study_additional_info study_contact study_data_link season study_season ontology observation_variable observation_unit observation_unit_xref treatment observation "

# For each CSV crop folder in dataset
ls -d /brapi-dataset/data/csv/*/ | while read CROP_FOLDER; do

  # For each table
  echo $TABLE_IN_ORDER | tr ' ' '\n' | while read TABLE; do
    CSV_FILE=$CROP_FOLDER/$TABLE.csv
    echo "Loading data for table $TABLE..."
    cat << EOF | psql -U postgres -f - | egrep -v 'COPY \d+'
    COPY $TABLE FROM '$CSV_FILE' DELIMITER ',' CSV HEADER;
EOF
  done

done

true
