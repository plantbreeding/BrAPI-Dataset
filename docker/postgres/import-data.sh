#!/bin/sh

cat << EOF | psql -U postgres -f -

COPY crop FROM '/brapi-dataset/data/crop.csv' DELIMITER ',' CSV HEADER;

-- germplasm related
COPY germplasm FROM '/brapi-dataset/data/crop1/germplasm.csv' DELIMITER ',' CSV HEADER;
COPY taxon_xref FROM '/brapi-dataset/data/crop1/taxon_xref.csv' DELIMITER ',' CSV HEADER;
COPY taxon_xref_germplasm FROM '/brapi-dataset/data/crop1/taxon_xref_germplasm.csv' DELIMITER ',' CSV HEADER;
COPY germplasm_attribute_category FROM '/brapi-dataset/data/crop1/germplasm_attribute_category.csv' DELIMITER ',' CSV HEADER;
COPY germplasm_attribute FROM '/brapi-dataset/data/crop1/germplasm_attribute.csv' DELIMITER ',' CSV HEADER;
COPY germplasm_attribute_value FROM '/brapi-dataset/data/crop1/germplasm_attribute_value.csv' DELIMITER ',' CSV HEADER;
COPY donor FROM '/brapi-dataset/data/crop1/donor.csv' DELIMITER ',' CSV HEADER;

-- study related
COPY contact FROM '/brapi-dataset/data/crop1/contact.csv' DELIMITER ',' CSV HEADER;
COPY location FROM '/brapi-dataset/data/crop1/location.csv' DELIMITER ',' CSV HEADER;
COPY program FROM '/brapi-dataset/data/crop1/program.csv' DELIMITER ',' CSV HEADER;
COPY trial FROM '/brapi-dataset/data/crop1/trial.csv' DELIMITER ',' CSV HEADER;

EOF
