#!/bin/sh

cat << EOF | PGPASSWORD=password psql -h postgres -U postgres postgres -f -

COPY crop FROM '/data/crop.csv' DELIMITER ',' CSV HEADER;

-- germplasm related
COPY germplasm FROM '/data/crop1/germplasm.csv' DELIMITER ',' CSV HEADER;
COPY taxon_xref FROM '/data/crop1/taxon_xref.csv' DELIMITER ',' CSV HEADER;
COPY taxon_xref_germplasm FROM '/data/crop1/taxon_xref_germplasm.csv' DELIMITER ',' CSV HEADER;
COPY germplasm_attribute_category FROM '/data/crop1/germplasm_attribute_category.csv' DELIMITER ',' CSV HEADER;
COPY germplasm_attribute FROM '/data/crop1/germplasm_attribute.csv' DELIMITER ',' CSV HEADER;
COPY germplasm_attribute_value FROM '/data/crop1/germplasm_attribute_value.csv' DELIMITER ',' CSV HEADER;
COPY donor FROM '/data/crop1/donor.csv' DELIMITER ',' CSV HEADER;

-- study related
COPY contact FROM '/data/crop1/contact.csv' DELIMITER ',' CSV HEADER;
COPY location FROM '/data/crop1/location.csv' DELIMITER ',' CSV HEADER;
COPY program FROM '/data/crop1/program.csv' DELIMITER ',' CSV HEADER;
COPY trial FROM '/data/crop1/trial.csv' DELIMITER ',' CSV HEADER;

EOF
