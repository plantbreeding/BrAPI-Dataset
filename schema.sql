
CREATE TABLE crop (
  cropDbId text NOT NULL PRIMARY KEY,
  commonName text NOT NULL
);

CREATE TABLE germplasm (
  cropDbId text REFERENCES crop(cropDbId),
  germplasmDbId text NOT NULL PRIMARY KEY,
  germplasmPUI text,
  germplasmName text NOT NULL,
  defaultDisplayName text,
  accessionNumber text,
  pedigree text,
  seedSource text,
  synonyms text, -- text[] ??
  instituteCode text,
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
  contactDbId text PRIMARY KEY,
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

-- TODO: add detailed fields
CREATE TABLE study (
  cropDbId text REFERENCES crop(cropDbId),
  trialDbId text REFERENCES trial(trialDbId),
  studyDbId text NOT NULL PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE season (
  cropDbId text REFERENCES crop(cropDbId),
  seasonDbId text NOT NULL PRIMARY KEY,
  year text,
  season text
);

-- TODO: add detailed fields
CREATE TABLE observation_unit (
  cropDbId text REFERENCES crop(cropDbId),
  studyDbId text REFERENCES study(studyDbId),
  observationUnitDbId text NOT NULL PRIMARY KEY,
  name text NOT NULL
);

-- TODO: add detailed fields
CREATE TABLE observation (
  cropDbId text REFERENCES crop(cropDbId),
  observationDbId text NOT NULL PRIMARY KEY
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
  observationVariableDbId text NOT NULL PRIMARY KEY,
  traitDbId text REFERENCES trait(traitDbId),
  methodDbId text REFERENCES method(methodDbId),
  scaleDbId text REFERENCES scale(scaleDbId)
);
