-- DROP TABLES

-- Phenotyping related
DROP TABLE IF EXISTS observation;
DROP TABLE IF EXISTS observation_variable;
DROP TABLE IF EXISTS method;
DROP TABLE IF EXISTS scale;
DROP TABLE IF EXISTS trait;
DROP TABLE IF EXISTS ontology;
DROP TABLE IF EXISTS observation_unit_treatment;
DROP TABLE IF EXISTS observation_unit_xref;
DROP TABLE IF EXISTS observation_unit;
DROP TABLE IF EXISTS sample;

-- Study related
DROP TABLE IF EXISTS study_season;
DROP TABLE IF EXISTS study_data_link;
DROP TABLE IF EXISTS study_contact;
DROP TABLE IF EXISTS study;
DROP TABLE IF EXISTS study_type;
DROP TABLE IF EXISTS contact;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS trial;
DROP TABLE IF EXISTS program;
DROP TABLE IF EXISTS season;

-- Genotyping related
DROP TABLE IF EXISTS map;
DROP TABLE IF EXISTS marker;
DROP TABLE IF EXISTS markerprofile;

-- Germplasm related
DROP TABLE IF EXISTS taxon_germplasm;
DROP TABLE IF EXISTS taxon;
DROP TABLE IF EXISTS pedigree;
DROP TABLE IF EXISTS donor;
DROP TABLE IF EXISTS germplasm_attribute_value;
DROP TABLE IF EXISTS germplasm_attribute;
DROP TABLE IF EXISTS germplasm;
DROP TABLE IF EXISTS crop;

-- CREATE TABLES

CREATE TABLE crop (
  cropDbId text NOT NULL PRIMARY KEY,
  commonName text NOT NULL
);

CREATE TABLE germplasm (
  cropDbId text REFERENCES crop(cropDbId),
  germplasmDbId text NOT NULL PRIMARY KEY,
  germplasmPUI text,
  germplasmName text NOT NULL,
  defaultDisplayName text NOT NULL,
  accessionNumber text,
  pedigree text,
  seedSource text,
  synonyms text, -- text[] ??
  instituteCode text NOT NULL,
  instituteName text,
  biologicalStatusOfAccessionCode text,
  countryOfOriginCode text,
  typeOfGermplasmStorageCode text,
  genus text,
  species text,
  speciesAuthority text,
  subtaxa text,
  subtaxaAuthority text,
  acquisitionDate text -- should be a date format
);

CREATE TABLE germplasm_attribute (
  cropDbId text REFERENCES crop(cropDbId),
  germplasmDbId text NOT NULL REFERENCES germplasm(germplasmDbId),
  attributeCategoryDbId text NOT NULL PRIMARY KEY,
  attributeCategoryName text,
  code text,
  uri text,
  name text,
  description text,
  datatype text
);

-- could be a text[] field in germplasm_attribute table
CREATE TABLE germplasm_attribute_value (
  cropDbId text REFERENCES crop(cropDbId),
  attributeCategoryDbId text NOT NULL REFERENCES germplasm_attribute(attributeCategoryDbId),
  attributeCategoryValueDbId text NOT NULL PRIMARY KEY,
  value text
);

CREATE TABLE pedigree (
  cropDbId text REFERENCES crop(cropDbId),
  germplasmDbId text NOT NULL REFERENCES germplasm(germplasmDbId),
  pedigree text NOT NULL,
  parent1Id text NOT NULL REFERENCES germplasm(germplasmDbId),
  parent2Id text NOT NULL REFERENCES germplasm(germplasmDbId)
);

CREATE TABLE taxon (
  cropDbId text REFERENCES crop(cropDbId),
  taxonDbId text NOT NULL PRIMARY KEY,
  source text NOT NULL,
  rank text -- very optionnal
);

CREATE TABLE taxon_germplasm (
  cropDbId text REFERENCES crop(cropDbId),
  taxonDbId text REFERENCES taxon(taxonDbId),
  germplasmDbId text REFERENCES germplasm(germplasmDbId)
);

CREATE TABLE donor (
  cropDbId text REFERENCES crop(cropDbId),
  germplasmDbId text REFERENCES germplasm(germplasmDbId),
  donorAccessionNumber text,
  donorInstituteCode text,
  donorGermplasmPUI text
);

CREATE TABLE location (
  cropDbId text REFERENCES crop(cropDbId),
  locationDbId text NOT NULL PRIMARY KEY,
  type text,
  name text,
  abbreviation text,
  countryCode text,
  countryName text,
  latitude numeric,
  longitude numeric,
  altitude numeric
);

CREATE TABLE contact (
  cropDbId text REFERENCES crop(cropDbId),
  contactDbId text NOT NULL PRIMARY KEY,
  name text,
  email text,
  type text,
  orcid text
);

CREATE TABLE program (
  cropDbId text REFERENCES crop(cropDbId),
  programDbId text NOT NULL PRIMARY KEY,
  name text NOT NULL,
  abbreviation text,
  objective text,
  leadPerson text
);

CREATE TABLE trial (
  cropDbId text REFERENCES crop(cropDbId),
  programDbId text REFERENCES program(programDbId),
  trialDbId text NOT NULL PRIMARY KEY,
  name text NOT NULL,
  startDate text, -- TODO: use a date format
  endDate text, -- TODO: use a date format
  active boolean
);

CREATE TABLE study_type (
  cropDbId text REFERENCES crop(cropDbId),
  name text NOT NULL PRIMARY KEY,
  description text
);

CREATE TABLE study (
  cropDbId text REFERENCES crop(cropDbId),
  trialDbId text NOT NULL REFERENCES trial(trialDbId),
  locationDbId text REFERENCES location(locationDbId),
  studyType text REFERENCES study_type(name),
  studyDbId text NOT NULL PRIMARY KEY,
  name text NOT NULL,
  description text,
  startDate text, -- TODO: use a date format
  endDate text, -- TODO: use a date format
  active boolean,
  license text,
  lastUpdateVersion text,
  lastUpdateTimestamp text -- TODO: use a date format
);

CREATE TABLE study_contact (
  cropDbId text REFERENCES crop(cropDbId),
  studyDbId text NOT NULL REFERENCES study(studyDbId),
  contactDbId text NOT NULL REFERENCES contact(contactDbId)
);

CREATE TABLE study_data_link (
  cropDbId text REFERENCES crop(cropDbId),
  studyDbId text NOT NULL REFERENCES study(studyDbId),
  name text,
  type text,
  url text NOT NULL
);

CREATE TABLE season (
  cropDbId text REFERENCES crop(cropDbId),
  seasonDbId text NOT NULL PRIMARY KEY,
  year text,
  season text
);

CREATE TABLE study_season (
  cropDbId text REFERENCES crop(cropDbId),
  studyDbId text NOT NULL REFERENCES study(studyDbId),
  seasonDbId text NOT NULL REFERENCES season(seasonDbId)
);

CREATE TABLE observation_unit (
  cropDbId text REFERENCES crop(cropDbId),
  studyDbId text NOT NULL REFERENCES study(studyDbId),
  germplasmDbId text NOT NULL REFERENCES germplasm(germplasmDbId),
  observationUnitDbId text NOT NULL PRIMARY KEY,
  name text NOT NULL,
  observationUnitLevel text,
  observationUnitLevels text,
  entryNumber text,
  entryType text,
  plotNumber text,
  blockNumber text,
  plantNumber text,
  x text,
  y text,
  replicate text
);

CREATE TABLE observation_unit_treatment (
  cropDbId text REFERENCES crop(cropDbId),
  observationUnitDbId text NOT NULL REFERENCES observation_unit(observationUnitDbId),
  factor text NOT NULL,
  modality text NOT NULL
);

CREATE TABLE observation_unit_xref (
  cropDbId text REFERENCES crop(cropDbId),
  observationUnitDbId text NOT NULL REFERENCES observation_unit(observationUnitDbId),
  source text NOT NULL,
  id text NOT NULL
);

-- TODO: add detailed fields
CREATE TABLE ontology (
  cropDbId text REFERENCES crop(cropDbId),
  ontologyDbId text NOT NULL PRIMARY KEY
);

-- TODO: add detailed fields
CREATE TABLE trait (
  cropDbId text REFERENCES crop(cropDbId),
  traitDbId text NOT NULL PRIMARY KEY
);

-- TODO: add detailed fields
CREATE TABLE method (
  cropDbId text REFERENCES crop(cropDbId),
  methodDbId text NOT NULL PRIMARY KEY
);

-- TODO: add detailed fields
CREATE TABLE scale (
  cropDbId text REFERENCES crop(cropDbId),
  scaleDbId text NOT NULL PRIMARY KEY
);

-- TODO: add detailed fields
CREATE TABLE observation_variable (
  cropDbId text REFERENCES crop(cropDbId),
  ontologyDbId text NOT NULL REFERENCES ontology(ontologyDbId),
  observationVariableDbId text NOT NULL PRIMARY KEY,
  traitDbId text REFERENCES trait(traitDbId),
  methodDbId text REFERENCES method(methodDbId),
  scaleDbId text REFERENCES scale(scaleDbId)
);

-- TODO: add detailed fields
CREATE TABLE observation (
  cropDbId text REFERENCES crop(cropDbId),
  observationUnitDbId text REFERENCES observation_unit(observationUnitDbId),
  observationVariableDbId text REFERENCES observation_variable(observationVariableDbId),
  observationTimeStamp text, -- TODO: use a date format
  observationDbId text NOT NULL PRIMARY KEY,
  seasonDbId text REFERENCES season(seasonDbId),
  collector text,
  value text
);

-- TODO: add detailed fields
CREATE TABLE map (
  cropDbId text REFERENCES crop(cropDbId),
  mapDbId text NOT NULL PRIMARY KEY
);

-- TODO: add detailed fields
CREATE TABLE marker (
  cropDbId text REFERENCES crop(cropDbId),
  markerDbId text NOT NULL,
  defaultDisplayName text,
  type text,
  synonyms text,
  refAlt text,
  analysisMethods text
);

-- TODO: add detailed fields
CREATE TABLE markerprofile (
  cropDbId text REFERENCES crop(cropDbId),
  markerProfileDbId text NOT NULL PRIMARY KEY
);

-- TODO: add detailed fields
CREATE TABLE sample (
  cropDbId text REFERENCES crop(cropDbId),
  sampleDbId text NOT NULL PRIMARY KEY
);
