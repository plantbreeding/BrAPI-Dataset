
COPY crop FROM '/data/crop.csv' DELIMITER ';' CSV HEADER;
COPY contact FROM '/data/crop1/contact.csv' DELIMITER ';' CSV HEADER;
COPY location FROM '/data/crop1/location.csv' DELIMITER ';' CSV HEADER;
COPY germplasm FROM '/data/crop1/germplasm.csv' DELIMITER ';' CSV HEADER;
COPY taxon FROM '/data/crop1/taxon.csv' DELIMITER ';' CSV HEADER;
COPY taxon_germplasm FROM '/data/crop1/taxon_germplasm.csv' DELIMITER ';' CSV HEADER;
COPY donor FROM '/data/crop1/donor.csv' DELIMITER ';' CSV HEADER;

COPY program FROM '/data/crop1/program.csv' DELIMITER ';' CSV HEADER;
COPY trial FROM '/data/crop1/trial.csv' DELIMITER ';' CSV HEADER;
