--This was generated from a postgres database populated with all the data in the /csv folder

CREATE TABLE contact (
    cropdbid text,
    contactdbid text NOT NULL,
    name text,
    email text,
    type text,
    orcid text,
    institutename text
);

CREATE TABLE crop (
    cropdbid text NOT NULL,
    commonname text NOT NULL
);

CREATE TABLE donor (
    cropdbid text,
    germplasmdbid text,
    donoraccessionnumber text,
    donorinstitutecode text,
    donorgermplasmpui text
);

CREATE TABLE germplasm (
    cropdbid text,
    germplasmdbid text NOT NULL,
    germplasmpui text,
    germplasmname text NOT NULL,
    defaultdisplayname text NOT NULL,
    accessionnumber text,
    pedigree text,
    seedsource text,
    synonyms text,
    institutecode text NOT NULL,
    institutename text,
    biologicalstatusofaccessioncode text,
    countryoforigincode text,
    typeofgermplasmstoragecode text,
    genus text,
    species text,
    speciesauthority text,
    subtaxa text,
    subtaxaauthority text,
    acquisitiondate text
);

CREATE TABLE germplasm_attribute (
    cropdbid text,
    attributecategorydbid text NOT NULL,
    attributedbid text NOT NULL,
    code text,
    uri text,
    name text NOT NULL,
    description text,
    datatype text,
    "values" text[]
);

CREATE TABLE germplasm_attribute_category (
    cropdbid text,
    attributecategorydbid text NOT NULL,
    attributecategoryname text
);

CREATE TABLE germplasm_attribute_value (
    cropdbid text,
    germplasmdbid text NOT NULL,
    attributedbid text NOT NULL,
    determineddate text,
    value text NOT NULL
);

CREATE TABLE location (
    cropdbid text,
    locationdbid text NOT NULL,
    type text,
    name text,
    abbreviation text,
    countrycode text,
    countryname text,
    latitude numeric,
    longitude numeric,
    altitude numeric,
    institutename text,
    instituteaddress text
);

CREATE TABLE location_additional_info (
    cropdbid text,
    locationdbid text,
    key text NOT NULL,
    value text NOT NULL
);

CREATE TABLE map (
    cropdbid text,
    mapdbid text NOT NULL
);

CREATE TABLE marker (
    cropdbid text,
    markerdbid text NOT NULL,
    defaultdisplayname text,
    type text,
    synonyms text,
    refalt text,
    analysismethods text
);

CREATE TABLE markerprofile (
    cropdbid text,
    markerprofiledbid text NOT NULL
);

CREATE TABLE method (
    cropdbid text,
    methoddbid text NOT NULL
);

CREATE TABLE observation (
    cropdbid text,
    observationunitdbid text,
    observationvariabledbid text,
    observationdbid text NOT NULL,
    observationtimestamp text,
    seasondbid text,
    collector text,
    value text
);

CREATE TABLE observation_unit (
    cropdbid text,
    studydbid text NOT NULL,
    germplasmdbid text NOT NULL,
    observationunitdbid text NOT NULL,
    name text NOT NULL,
    observationlevel text,
    observationlevels text,
    entrynumber text,
    entrytype text,
    plotnumber text,
    blocknumber text,
    plantnumber text,
    x text,
    y text,
    replicate text
);

CREATE TABLE observation_unit_xref (
    cropdbid text,
    observationunitdbid text NOT NULL,
    source text NOT NULL,
    id text NOT NULL
);

CREATE TABLE observation_variable (
    cropdbid text,
    ontologydbid text NOT NULL,
    observationvariabledbid text NOT NULL,
    observationvariablename text,
    traitdbid text,
    methoddbid text,
    scaledbid text
);

CREATE TABLE ontology (
    cropdbid text,
    ontologydbid text NOT NULL
);

CREATE TABLE pedigree (
    cropdbid text,
    germplasmdbid text NOT NULL,
    pedigree text NOT NULL,
    parent1id text NOT NULL,
    parent2id text NOT NULL
);

CREATE TABLE program (
    cropdbid text,
    programdbid text NOT NULL,
    name text NOT NULL,
    abbreviation text,
    objective text,
    leadperson text
);

CREATE TABLE sample (
    cropdbid text,
    sampledbid text NOT NULL
);

CREATE TABLE scale (
    cropdbid text,
    scaledbid text NOT NULL
);

CREATE TABLE season (
    cropdbid text,
    seasondbid text NOT NULL,
    year text,
    season text
);

CREATE TABLE study (
    cropdbid text,
    trialdbid text NOT NULL,
    locationdbid text,
    studytype text,
    studydbid text NOT NULL,
    name text NOT NULL,
    description text,
    startdate text,
    enddate text,
    active boolean,
    license text,
    lastupdateversion text,
    lastupdatetimestamp text
);

CREATE TABLE study_additional_info (
    cropdbid text,
    studydbid text,
    key text NOT NULL,
    value text NOT NULL
);

CREATE TABLE study_contact (
    cropdbid text,
    studydbid text NOT NULL,
    contactdbid text NOT NULL
);

CREATE TABLE study_data_link (
    cropdbid text,
    studydbid text NOT NULL,
    name text,
    type text,
    url text NOT NULL
);

CREATE TABLE study_season (
    cropdbid text,
    studydbid text NOT NULL,
    seasondbid text NOT NULL
);

CREATE TABLE study_type (
    cropdbid text,
    name text NOT NULL,
    description text
);

CREATE TABLE taxon_xref (
    cropdbid text,
    taxondbid text NOT NULL,
    source text NOT NULL,
    rank text
);

CREATE TABLE taxon_xref_germplasm (
    cropdbid text,
    taxondbid text,
    germplasmdbid text
);

CREATE TABLE trait (
    cropdbid text,
    traitdbid text NOT NULL
);

CREATE TABLE treatment (
    cropdbid text,
    observationunitdbid text NOT NULL,
    factor text NOT NULL,
    modality text NOT NULL
);

CREATE TABLE trial (
    cropdbid text,
    programdbid text,
    trialdbid text NOT NULL,
    name text NOT NULL,
    startdate text,
    enddate text,
    active boolean,
    datasetauthorshiplicence text,
    datasetauthorshipdatasetpui text
);

CREATE TABLE trial_additional_info (
    cropdbid text,
    trialdbid text,
    key text NOT NULL,
    value text NOT NULL
);

CREATE TABLE trial_contact (
    cropdbid text,
    trialdbid text,
    contactdbid text
);

INSERT INTO contact (cropdbid, contactdbid, name, email, type, orcid, institutename) VALUES ('1', '1', 'A. Breeder', 'a.breeder@brapi.org', 'Breeder', '0000-0002-0607-8728', 'Plant Science Institute');
INSERT INTO contact (cropdbid, contactdbid, name, email, type, orcid, institutename) VALUES ('1', '2', 'B. Breeder', 'b.breeder@brapi.org', 'Breeder', '0000-0002-0607-8729', 'Plant Science Institute');
INSERT INTO contact (cropdbid, contactdbid, name, email, type, orcid, institutename) VALUES ('1', '3', 'A. Technician', 'a.technician@brapi.org', 'Technician', '0000-0002-0607-8731', 'Plant Science Institute');
INSERT INTO contact (cropdbid, contactdbid, name, email, type, orcid, institutename) VALUES ('1', '4', 'B. Technician', 'b.technician@brapi.org', 'Technician', '0000-0002-0607-8732', 'Plant Science Institute');

INSERT INTO crop (cropdbid, commonname) VALUES ('1', 'crop1');

INSERT INTO donor (cropdbid, germplasmdbid, donoraccessionnumber, donorinstitutecode, donorgermplasmpui) VALUES ('1', '1', 'A001230', 'INRA', 'https://doi.org/10.1109/5.771073');
INSERT INTO donor (cropdbid, germplasmdbid, donoraccessionnumber, donorinstitutecode, donorgermplasmpui) VALUES ('1', '1', 'A001310', 'INRA', 'https://doi.org/10.1109/5.231123');

INSERT INTO germplasm (cropdbid, germplasmdbid, germplasmpui, germplasmname, defaultdisplayname, accessionnumber, pedigree, seedsource, synonyms, institutecode, institutename, biologicalstatusofaccessioncode, countryoforigincode, typeofgermplasmstoragecode, genus, species, speciesauthority, subtaxa, subtaxaauthority, acquisitiondate) VALUES ('1', '1', 'http://pui.per/accession/A000001', 'Name001', 'G000001', 'A000001', 'landrace', 'open pollination', 'landrace 1', 'PER001', 'INST1', '300', 'COUNTRY1', '13', 'Fructus', 'novus', 'L', 'subtaxa', 'N', '19840101');
INSERT INTO germplasm (cropdbid, germplasmdbid, germplasmpui, germplasmname, defaultdisplayname, accessionnumber, pedigree, seedsource, synonyms, institutecode, institutename, biologicalstatusofaccessioncode, countryoforigincode, typeofgermplasmstoragecode, genus, species, speciesauthority, subtaxa, subtaxaauthority, acquisitiondate) VALUES ('1', '2', 'http://pui.per/accession/A000002', 'Name002', 'G000002', 'A000002', 'landrace', 'open pollination', 'landrace 2', 'PER001', 'INST1', '300', 'COUNTRY1', '20', 'Fructus', 'novus', 'L', 'subtaxa', 'N', '19840101');
INSERT INTO germplasm (cropdbid, germplasmdbid, germplasmpui, germplasmname, defaultdisplayname, accessionnumber, pedigree, seedsource, synonyms, institutecode, institutename, biologicalstatusofaccessioncode, countryoforigincode, typeofgermplasmstoragecode, genus, species, speciesauthority, subtaxa, subtaxaauthority, acquisitiondate) VALUES ('1', '3', 'http://pui.per/accession/A000003', 'Name003', 'G000003', 'A000003', 'A000001 / A000002', 'A000001/A000002', 'variety 1', 'PER001', 'INST1', '500', 'COUNTRY1', '12', 'Fructus', 'novus', 'L', 'subtaxa', 'N', '20010101');
INSERT INTO germplasm (cropdbid, germplasmdbid, germplasmpui, germplasmname, defaultdisplayname, accessionnumber, pedigree, seedsource, synonyms, institutecode, institutename, biologicalstatusofaccessioncode, countryoforigincode, typeofgermplasmstoragecode, genus, species, speciesauthority, subtaxa, subtaxaauthority, acquisitiondate) VALUES ('1', '4', 'http://pui.per/accession/A000004', 'Name004', 'G000004', 'A000004', NULL, NULL, 'variety 4', 'PER001', 'INST1', '500', 'COUNTRY1', '12', 'Fructus', 'novus', 'L', 'subtaxa', 'N', '20010101');
INSERT INTO germplasm (cropdbid, germplasmdbid, germplasmpui, germplasmname, defaultdisplayname, accessionnumber, pedigree, seedsource, synonyms, institutecode, institutename, biologicalstatusofaccessioncode, countryoforigincode, typeofgermplasmstoragecode, genus, species, speciesauthority, subtaxa, subtaxaauthority, acquisitiondate) VALUES ('1', '5', 'http://pui.per/accession/A000005', 'Name005', 'G000005', 'A000005', NULL, NULL, 'variety 5', 'PER001', 'INST1', '500', 'COUNTRY1', '12', 'Fructus', 'novus', 'L', 'subtaxa', 'N', '20010101');
INSERT INTO germplasm (cropdbid, germplasmdbid, germplasmpui, germplasmname, defaultdisplayname, accessionnumber, pedigree, seedsource, synonyms, institutecode, institutename, biologicalstatusofaccessioncode, countryoforigincode, typeofgermplasmstoragecode, genus, species, speciesauthority, subtaxa, subtaxaauthority, acquisitiondate) VALUES ('1', '6', 'http://pui.per/accession/A000006', 'Name006', 'G000006', 'A000006', NULL, NULL, 'variety 6', 'PER001', 'INST1', '500', 'COUNTRY1', '12', 'Fructus', 'novus', 'L', 'subtaxa', 'N', '20010101');
INSERT INTO germplasm (cropdbid, germplasmdbid, germplasmpui, germplasmname, defaultdisplayname, accessionnumber, pedigree, seedsource, synonyms, institutecode, institutename, biologicalstatusofaccessioncode, countryoforigincode, typeofgermplasmstoragecode, genus, species, speciesauthority, subtaxa, subtaxaauthority, acquisitiondate) VALUES ('1', '7', 'http://pui.per/accession/A000007', 'Name007', 'G000007', 'A000007', NULL, NULL, 'variety 7', 'PER001', 'INST1', '500', 'COUNTRY1', '12', 'Fructus', 'novus', 'L', 'subtaxa', 'N', '20010101');
INSERT INTO germplasm (cropdbid, germplasmdbid, germplasmpui, germplasmname, defaultdisplayname, accessionnumber, pedigree, seedsource, synonyms, institutecode, institutename, biologicalstatusofaccessioncode, countryoforigincode, typeofgermplasmstoragecode, genus, species, speciesauthority, subtaxa, subtaxaauthority, acquisitiondate) VALUES ('1', '8', 'http://pui.per/accession/A000008', 'Name008', 'G000008', 'A000008', NULL, NULL, 'variety 8', 'PER001', 'INST1', '500', 'COUNTRY1', '12', 'Fructus', 'novus', 'L', 'subtaxa', 'N', '20010101');
INSERT INTO germplasm (cropdbid, germplasmdbid, germplasmpui, germplasmname, defaultdisplayname, accessionnumber, pedigree, seedsource, synonyms, institutecode, institutename, biologicalstatusofaccessioncode, countryoforigincode, typeofgermplasmstoragecode, genus, species, speciesauthority, subtaxa, subtaxaauthority, acquisitiondate) VALUES ('1', '9', 'http://pui.per/accession/A000009', 'Local_variety', 'Local_variety', 'A000009', 'landrace', 'open pollination', 'landrace', 'PER001', 'INST1', '300', 'COUNTRY1', '13', 'Fructus', 'novus', 'L', 'subtaxa', 'N', '20010101');

INSERT INTO germplasm_attribute (cropdbid, attributecategorydbid, attributedbid, code, uri, name, description, datatype, "values") VALUES ('1', '2', '1', 'RHT', 'http://www.brapi.org/ontology/MO_123:1000001', 'Rht-B1b', 'Allele of marker 11_4769', 'Categorical', '{Present,Absent,Heterozygous}');
INSERT INTO germplasm_attribute (cropdbid, attributecategorydbid, attributedbid, code, uri, name, description, datatype, "values") VALUES ('1', '3', '2', 'WEV', 'http://www.brapi.org/ontology/MO_123:1000002', 'Weevil Resistance', 'Resistance allele', 'Categorical', '{1,2,3,4,5,6,7,8,9}');
INSERT INTO germplasm_attribute (cropdbid, attributecategorydbid, attributedbid, code, uri, name, description, datatype, "values") VALUES ('1', '1', '3', 'FLSHORG', 'http://www.brapi.org/ontology/MO_123:1000003', 'Flesh Color Orange allele', 'Allelele for orange flesh', 'Categorical', '{1,3,5,7,9}');
INSERT INTO germplasm_attribute (cropdbid, attributecategorydbid, attributedbid, code, uri, name, description, datatype, "values") VALUES ('1', '1', '4', 'FLWCOL', 'http://www.brapi.org/ontology/MO_123:1000004', 'Flower color white allele', 'Allele for white flower color', 'Categorical', '{Present,Absent,Heterozygous}');
INSERT INTO germplasm_attribute (cropdbid, attributecategorydbid, attributedbid, code, uri, name, description, datatype, "values") VALUES ('1', '3', '5', 'RAL1', 'http://www.brapi.org/ontology/MO_123:1000005', 'R allele 1', 'Resistance allele 1', 'Categorical', '{1,2,3,4,5,6,7,8,9}');
INSERT INTO germplasm_attribute (cropdbid, attributecategorydbid, attributedbid, code, uri, name, description, datatype, "values") VALUES ('1', '3', '6', 'RAL2', 'http://www.brapi.org/ontology/MO_123:1000006', 'R allele 2', 'Resistance allele 2', 'Categorical', '{1,2,3,4,5,6,7,8,9}');
INSERT INTO germplasm_attribute (cropdbid, attributecategorydbid, attributedbid, code, uri, name, description, datatype, "values") VALUES ('1', '3', '7', 'RAL3', 'http://www.brapi.org/ontology/MO_123:1000007', 'R allele 3', 'Resistance allele 3', 'Categorical', '{1,2,3,4,5,6,7,8,9}');
INSERT INTO germplasm_attribute (cropdbid, attributecategorydbid, attributedbid, code, uri, name, description, datatype, "values") VALUES ('1', '4', '8', 'RAL4', 'http://www.brapi.org/ontology/MO_123:1000008', 'R allele 4', 'Resistance allele 4', 'Categorical', '{1,2,3,4,5,6,7,8,9}');
INSERT INTO germplasm_attribute (cropdbid, attributecategorydbid, attributedbid, code, uri, name, description, datatype, "values") VALUES ('1', '4', '9', 'RAL5', 'http://www.brapi.org/ontology/MO_123:1000009', 'R allele 5', 'Resistance allele 5', 'Categorical', '{1,2,3,4,5,6,7,8,9}');
INSERT INTO germplasm_attribute (cropdbid, attributecategorydbid, attributedbid, code, uri, name, description, datatype, "values") VALUES ('1', '4', '10', 'RAL6', 'http://www.brapi.org/ontology/MO_123:1000010', 'R allele 6', 'Resistance allele', 'Categorical', '{1,2,3,4}');

INSERT INTO germplasm_attribute_category (cropdbid, attributecategorydbid, attributecategoryname) VALUES ('1', '1', 'Morphological');
INSERT INTO germplasm_attribute_category (cropdbid, attributecategorydbid, attributecategoryname) VALUES ('1', '2', 'Agronomic');
INSERT INTO germplasm_attribute_category (cropdbid, attributecategorydbid, attributecategoryname) VALUES ('1', '3', 'Biotic stress');
INSERT INTO germplasm_attribute_category (cropdbid, attributecategorydbid, attributecategoryname) VALUES ('1', '4', 'Abiotic stress');

INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '1', '1', '20160101', 'Present');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '1', '2', '20160101', 'Absent');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '1', '3', '20160101', '1');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '1', '4', '20160101', '3');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '1', '5', '20160101', 'Heterozygous');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '1', '6', '20161101', '5');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '1', '7', '20161201', '7');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '1', '8', '20161201', '9');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '1', '9', '20161201', '3');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '1', '10', '20161201', '1');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '2', '1', '20170215', 'Absent');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '2', '2', '20170215', 'Heterozygous');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '2', '3', '20170215', '3');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '2', '4', '20170215', '4');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '2', '5', '20170215', 'Absent');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '2', '6', '20170215', '7');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '2', '7', '20170215', '8');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '2', '8', '20170215', '2');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '2', '9', '20170215', '1');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '2', '10', '20170215', '8');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '3', '1', '20170215', 'Heterozygous');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '3', '2', '20170215', 'Present');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '3', '3', '20170215', '9');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '3', '4', '20170215', '5');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '3', '5', '20170215', '1');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '3', '6', '20170215', '2');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '3', '7', '20170215', '6');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '3', '8', '20170215', '7');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '3', '9', '20170215', '8');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '3', '10', '20170215', '4');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '4', '1', '20170215', 'Present');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '4', '2', '20170215', 'Heterozygous');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '4', '3', '20170215', '5');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '4', '4', '20170215', '9');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '4', '5', '20170215', 'Absent');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '4', '6', '20170215', '9');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '4', '7', '20170215', '8');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '4', '8', '20170215', '7');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '4', '9', '20170215', '6');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '4', '10', '20170215', '5');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '5', '1', '20151111', 'Absent');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '5', '2', '20151111', 'Heterozygous');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '5', '3', '20151111', '8');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '5', '4', '20151111', '5');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '5', '5', '20151111', 'Absent');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '5', '6', '20151111', '3');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '5', '7', '20151111', '4');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '5', '8', '20151111', '5');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '5', '9', '20151111', '6');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '5', '10', '20151111', '7');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '6', '1', '20151111', 'Heterozygous');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '6', '2', '20151111', 'Absent');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '6', '3', '20151111', '8');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '6', '4', '20151111', '7');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '6', '5', '20151111', 'Present');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '6', '6', '20151111', '7');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '6', '7', '20151111', '6');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '6', '8', '20151111', '5');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '6', '9', '20151111', '2');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '6', '10', '20151111', '3');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '7', '1', '20151111', 'Present');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '7', '2', '20151111', 'Heterozygous');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '7', '3', '20151111', '9');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '7', '4', '20151111', '8');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '7', '5', '20151111', 'Present');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '7', '6', '20151111', '3');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '7', '7', '20151111', '2');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '7', '8', '20151111', '6');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '7', '9', '20151111', '4');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '7', '10', '20151111', '9');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '8', '1', '20151111', 'Absent');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '8', '2', '20151111', 'Absent');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '8', '3', '20151111', '9');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '8', '4', '20151111', '1');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '8', '5', '20151111', 'Heterozygous');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '8', '6', '20151111', '7');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '8', '7', '20151111', '5');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '8', '8', '20151111', '9');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '8', '9', '20151111', '7');
INSERT INTO germplasm_attribute_value (cropdbid, germplasmdbid, attributedbid, determineddate, value) VALUES ('1', '8', '10', '20151111', '3');

INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '1', 'Storage location', 'Location 1', 'L1', 'PER', 'Peru', -11.1275, -75.356389, 828, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '2', 'Breeding location', 'Location 2', 'L2', 'PER', 'Peru', -11.16116, -75.34171, 964, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '3', 'Storage location', 'Location 3', 'L3', 'PER', 'Peru', -12.076289, -76.948417, 244, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '4', 'Farmer field location', 'Location 4', 'L4', 'MOZ', 'Mozambique', -15.4669, 36.9777, 701, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '5', 'Breeding location', 'Location 5', 'L5', 'MOZ', 'Mozambique', -26.0283, 32.39, 7, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '6', 'Breeding location', 'Location 6', 'L6', 'PER', 'Peru', -10.96096, -75.22065, 717, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '7', 'Breeding location', 'Location 7', 'L7', 'PER', 'Peru', -10.931809, -74.855467, 484, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '8', 'Farmer field location', 'Location 8', 'L8', 'PER', 'Peru', -11.05304, -73.75254, 252, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '9', 'Farmer field location', 'Location 9', 'L9', 'PER', 'Peru', -11.05304, -73.75254, 252, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '10', 'Breeding location', 'Location 10', 'L10', 'PER', 'Peru', -11.25847, -73.82075, 276, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '11', 'Breeding location', 'Location 11', 'L11', 'PER', 'Peru', -11.14639, -74.30748, 323, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '12', 'Breeding location', 'Location 12', 'L12', 'PER', 'Peru', -11.30817, -74.69242, 758, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '13', 'Farmer field location', 'Location 13', 'L13', 'GHA', 'Ghana', 6.71, -1.572, 288, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '14', 'Farmer field location', 'Location 14', 'L14', 'GHA', 'Ghana', 5.123, -1.462, 26, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '15', 'Farmer field location', 'Location 15', 'L15', 'GHA', 'Ghana', 10.87, -1.1466, 183, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '16', 'Storage location', 'Location 16', 'L16', 'UGA', 'Uganda', 0.529144, 32.61246, 1173, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');
INSERT INTO location (cropdbid, locationdbid, type, name, abbreviation, countrycode, countryname, latitude, longitude, altitude, institutename, instituteaddress) VALUES ('1', '17', 'Storage location', 'Location 17', 'L17', 'UGA', 'Uganda', 1.528, 33.616, 1067, 'Plant Science Institute', '71 Pilgrim Avenue Chevy Chase MD 20815');

INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '6', 'altern', 'MARANK');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '7', 'altern', 'SHIRANI');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '8', 'altern', 'BETALT');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '9', 'altern', 'BETBAJ');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '10', 'altern', 'OVIRI');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '11', 'altern', 'PTOCOPA');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '12', 'altern', 'SNPEDRO');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '1', 'local', 'San Ramon');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '4', 'local', 'Gurue');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '5', 'local', 'Umbeluzi');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '6', 'local', 'San Miguel Centro Marankiari');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '7', 'local', 'Shirani');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '8', 'local', 'Betania');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '9', 'local', 'Betania');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '10', 'local', 'Nuevaluz Oviri');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '11', 'local', 'Puerto Ocopa');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '12', 'local', 'San Pedro');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '13', 'local', 'Fumesua');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '14', 'local', 'Komenda');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '15', 'local', 'Tono dam');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '16', 'local', 'NaCRRI');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '17', 'local', 'NaSARRI');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '1', 'cont', 'South America');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '4', 'cont', 'Africa');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '5', 'cont', 'Africa');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '6', 'cont', 'South America');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '7', 'cont', 'South America');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '8', 'cont', 'South America');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '9', 'cont', 'South America');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '10', 'cont', 'South America');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '11', 'cont', 'South America');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '12', 'cont', 'South America');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '13', 'cont', 'Africa');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '14', 'cont', 'Africa');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '15', 'cont', 'Africa');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '16', 'cont', 'Africa');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '17', 'cont', 'Africa');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '1', 'creg', 'LAC');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '3', 'creg', 'NA');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '4', 'creg', 'SSA');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '5', 'creg', 'SSA');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '6', 'creg', 'LAC');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '7', 'creg', 'LAC');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '8', 'creg', 'LAC');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '9', 'creg', 'LAC');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '10', 'creg', 'LAC');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '11', 'creg', 'LAC');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '12', 'creg', 'LAC');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '13', 'creg', 'SSA');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '14', 'creg', 'SSA');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '15', 'creg', 'SSA');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '16', 'creg', 'SSA');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '17', 'creg', 'SSA');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '1', 'adm3', 'San Ramon');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '4', 'adm3', 'Gurue');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '5', 'adm3', 'Umbeluzi');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '6', 'adm3', 'Perené');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '7', 'adm3', 'Pichanaki');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '8', 'adm3', 'Rio Tambo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '9', 'adm3', 'Rio Tambo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '10', 'adm3', 'Rio Tambo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '11', 'adm3', 'Rio Tambo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '12', 'adm3', 'Coviriali');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '1', 'adm2', 'Chanchamayo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '4', 'adm2', 'Gurue');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '5', 'adm2', 'Boane');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '6', 'adm2', 'Chanchamayo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '7', 'adm2', 'Chanchamayo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '8', 'adm2', 'Satipo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '9', 'adm2', 'Satipo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '10', 'adm2', 'Satipo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '11', 'adm2', 'Satipo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '12', 'adm2', 'Satipo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '13', 'adm2', 'Ejisu-Juaben');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '15', 'adm2', 'Kassena-Nankana');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '1', 'adm1', 'Junin');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '4', 'adm1', 'Zambezia');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '5', 'adm1', 'Maputo');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '6', 'adm1', 'Junin');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '7', 'adm1', 'Junin');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '8', 'adm1', 'Junin');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '9', 'adm1', 'Junin');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '10', 'adm1', 'Junin');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '11', 'adm1', 'Junin');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '12', 'adm1', 'Junin');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '13', 'adm1', 'Ashanti');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '14', 'adm1', 'Central');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '15', 'adm1', 'Upper East');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '17', 'adm1', 'Serere');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '1', 'annualTotalPrecipitation', '360');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '3', 'annualTotalPrecipitation', '6.4');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '1', 'annualMeanTemperature', '23');
INSERT INTO location_additional_info (cropdbid, locationdbid, key, value) VALUES ('1', '3', 'annualMeanTemperature', '19.2');

INSERT INTO method (cropdbid, methoddbid) VALUES ('1', '1');

INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '1', 'MO_123:100002', '1', '2013-06-14T22:03:51Z', '1', 'A. Technician', '1.2');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '1', 'MO_123:100006', '2', '2013-06-14T22:04:51Z', '1', 'A. Technician', '4.5');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '2', 'MO_123:100002', '3', '2013-06-14T22:05:51Z', '1', 'A. Technician', '1.1');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '2', 'MO_123:100006', '4', '2013-06-14T22:06:51Z', '1', 'A. Technician', '5.1');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '3', 'MO_123:100003', '5', '2013-06-14T22:07:51Z', '4', 'A. Technician', '2.1');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '3', 'MO_123:100004', '6', '2013-06-14T22:08:51Z', '4', 'A. Technician', 'dark blue');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '4', 'MO_123:100003', '7', '2013-06-14T22:09:51Z', '5', 'A. Technician', '1.8');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '4', 'MO_123:100004', '8', '2013-06-14T22:10:51Z', '5', 'A. Technician', 'blue');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '5', 'MO_123:100002', '9', '2013-06-14T22:11:51Z', '3', 'A. Technician', '2.1');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '6', 'MO_123:100006', '10', '2013-06-14T22:12:51Z', '3', 'A. Technician', '4.5');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '7', 'MO_123:100003', '11', '2013-06-14T22:13:51Z', '3', 'A. Technician', '1.4');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '8', 'MO_123:100004', '12', '2013-06-14T22:14:51Z', '3', 'A. Technician', 'red');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '9', 'MO_123:100002', '13', '2011-06-14T22:03:51Z', '2', 'B. Tech', '10');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '9', 'MO_123:100003', '14', '2011-06-14T22:04:51Z', '2', 'B. Tech', '20');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '9', 'MO_123:100004', '15', '2011-06-14T22:05:51Z', '2', 'B. Tech', 'red');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '10', 'MO_123:100002', '16', '2011-06-14T22:06:51Z', '2', 'B. Tech', '100');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '10', 'MO_123:100003', '17', '2011-06-14T22:07:51Z', '2', 'B. Tech', '9');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '10', 'MO_123:100005', '18', '2011-06-14T22:08:51Z', '2', 'B. Tech', '2');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '11', 'MO_123:100002', '19', '2011-06-14T22:09:51Z', '2', 'B. Tech', '11');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '11', 'MO_123:100003', '20', '2011-06-14T22:10:51Z', '2', 'B. Tech', '12');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '11', 'MO_123:100004', '21', '2011-06-14T22:11:51Z', '2', 'B. Tech', 'black');
INSERT INTO observation (cropdbid, observationunitdbid, observationvariabledbid, observationdbid, observationtimestamp, seasondbid, collector, value) VALUES ('1', '11', 'MO_123:100005', '22', '2011-06-14T22:12:51Z', '2', 'B. Tech', '5');

INSERT INTO observation_unit (cropdbid, studydbid, germplasmdbid, observationunitdbid, name, observationlevel, observationlevels, entrynumber, entrytype, plotnumber, blocknumber, plantnumber, x, y, replicate) VALUES ('1', '1001', '1', '1', 'Plot 1', 'plot', 'block:1;plot:1', '1', 'test', '1', '1', NULL, '1', '1', '0');
INSERT INTO observation_unit (cropdbid, studydbid, germplasmdbid, observationunitdbid, name, observationlevel, observationlevels, entrynumber, entrytype, plotnumber, blocknumber, plantnumber, x, y, replicate) VALUES ('1', '1001', '1', '2', 'Plant 1', 'plant', 'block:1;plot:1;plant:1', '2', 'test', '1', '1', '1', '1', '1', '0');
INSERT INTO observation_unit (cropdbid, studydbid, germplasmdbid, observationunitdbid, name, observationlevel, observationlevels, entrynumber, entrytype, plotnumber, blocknumber, plantnumber, x, y, replicate) VALUES ('1', '1001', '2', '3', 'Plot 2', 'plot', 'block:1;plot:2', '3', 'test', '2', '1', NULL, '1', '2', '0');
INSERT INTO observation_unit (cropdbid, studydbid, germplasmdbid, observationunitdbid, name, observationlevel, observationlevels, entrynumber, entrytype, plotnumber, blocknumber, plantnumber, x, y, replicate) VALUES ('1', '1001', '2', '4', 'Plant 2', 'plant', 'block:1;plot:2;plant:2', '4', 'test', '2', '1', '2', '1', '2', '0');
INSERT INTO observation_unit (cropdbid, studydbid, germplasmdbid, observationunitdbid, name, observationlevel, observationlevels, entrynumber, entrytype, plotnumber, blocknumber, plantnumber, x, y, replicate) VALUES ('1', '1002', '1', '5', 'Plot 3', 'plot', 'block:1;plot:3 ', '5', 'test', '3', '1', NULL, '1', '1', '0');
INSERT INTO observation_unit (cropdbid, studydbid, germplasmdbid, observationunitdbid, name, observationlevel, observationlevels, entrynumber, entrytype, plotnumber, blocknumber, plantnumber, x, y, replicate) VALUES ('1', '1002', '1', '6', 'Plant 3', 'plant', 'block:1;plot:3;plant:3', '6', 'test', '3', '1', '3', '1', '1', '0');
INSERT INTO observation_unit (cropdbid, studydbid, germplasmdbid, observationunitdbid, name, observationlevel, observationlevels, entrynumber, entrytype, plotnumber, blocknumber, plantnumber, x, y, replicate) VALUES ('1', '1002', '3', '7', 'Plot 4', 'plot', 'block:1;plot:4', '7', 'test', '4', '1', NULL, '1', '2', '0');
INSERT INTO observation_unit (cropdbid, studydbid, germplasmdbid, observationunitdbid, name, observationlevel, observationlevels, entrynumber, entrytype, plotnumber, blocknumber, plantnumber, x, y, replicate) VALUES ('1', '1002', '3', '8', 'Plant 4', 'plant', 'block:1;plot:4;plant:4', '8', 'test', '4', '1', '4', '1', '2', '0');
INSERT INTO observation_unit (cropdbid, studydbid, germplasmdbid, observationunitdbid, name, observationlevel, observationlevels, entrynumber, entrytype, plotnumber, blocknumber, plantnumber, x, y, replicate) VALUES ('1', '1003', '4', '9', 'Plot 5', 'plot', 'block:101;plot:5', '1', 'check', '5', '101', NULL, '1', '1', '1');
INSERT INTO observation_unit (cropdbid, studydbid, germplasmdbid, observationunitdbid, name, observationlevel, observationlevels, entrynumber, entrytype, plotnumber, blocknumber, plantnumber, x, y, replicate) VALUES ('1', '1003', '4', '10', 'Plant 5', 'plant', 'block:101;plot:5;plant:5', '1', 'test', '5', '101', '5', '1', '1', '1');
INSERT INTO observation_unit (cropdbid, studydbid, germplasmdbid, observationunitdbid, name, observationlevel, observationlevels, entrynumber, entrytype, plotnumber, blocknumber, plantnumber, x, y, replicate) VALUES ('1', '1003', '2', '11', 'Plot 6', 'plot', 'block:101;plot:6', '1', 'test', '6', '101', NULL, '1', '1', '1');

INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '1', 'ebi.biosample', 'SAMEA179865230');
INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '1', 'gnpis.lot', 'INRA:CoeSt6 _SMH03');
INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '1', 'kernelDB', '239865');
INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '2', 'ebi.biosample', 'SAMEA179865815');
INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '2', 'gnpis.lot', 'INRA:CoeSt6 _SMH13');
INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '2', 'kernelDB', '239167');
INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '3', 'ebi.biosample', 'SAMEA179865682');
INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '3', 'gnpis.lot', 'INRA:CoeSt6 _SMH51');
INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '3', 'kernelDB', '239146');
INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '4', 'ebi.biosample', 'SAMEA179865891');
INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '4', 'gnpis.lot', 'INRA:CoeSt6 _SMH89');
INSERT INTO observation_unit_xref (cropdbid, observationunitdbid, source, id) VALUES ('1', '4', 'kernelDB', '239612');

INSERT INTO observation_variable (cropdbid, ontologydbid, observationvariabledbid, observationvariablename, traitdbid, methoddbid, scaledbid) VALUES ('1', 'MO_123', 'MO_123:100002', 'Plant height', NULL, NULL, NULL);
INSERT INTO observation_variable (cropdbid, ontologydbid, observationvariabledbid, observationvariablename, traitdbid, methoddbid, scaledbid) VALUES ('1', 'MO_123', 'MO_123:100006', 'Carotenoid', NULL, NULL, NULL);
INSERT INTO observation_variable (cropdbid, ontologydbid, observationvariabledbid, observationvariablename, traitdbid, methoddbid, scaledbid) VALUES ('1', 'MO_123', 'MO_123:100003', 'Root weight', NULL, NULL, NULL);
INSERT INTO observation_variable (cropdbid, ontologydbid, observationvariabledbid, observationvariablename, traitdbid, methoddbid, scaledbid) VALUES ('1', 'MO_123', 'MO_123:100004', 'Root color', NULL, NULL, NULL);
INSERT INTO observation_variable (cropdbid, ontologydbid, observationvariabledbid, observationvariablename, traitdbid, methoddbid, scaledbid) VALUES ('1', 'MO_123', 'MO_123:100005', 'Virus susceptibility', NULL, NULL, NULL);

INSERT INTO ontology (cropdbid, ontologydbid) VALUES ('1', 'MO_123');

INSERT INTO program (cropdbid, programdbid, name, abbreviation, objective, leadperson) VALUES ('1', '1', 'P1', 'G. Leader', 'Global Population Improvement', 'Program 1');
INSERT INTO program (cropdbid, programdbid, name, abbreviation, objective, leadperson) VALUES ('1', '2', 'P2', 'M. Breeder', 'XYZ', 'Program 2');
INSERT INTO program (cropdbid, programdbid, name, abbreviation, objective, leadperson) VALUES ('1', '3', 'P3', 'W. Select', 'XYZ', 'Program 3');
INSERT INTO program (cropdbid, programdbid, name, abbreviation, objective, leadperson) VALUES ('1', '4', 'P4', 'G. Gain', 'ABC', 'Program 4');
INSERT INTO program (cropdbid, programdbid, name, abbreviation, objective, leadperson) VALUES ('1', '5', 'P5', 'C. Improvement', 'Processing', 'Program 5');
INSERT INTO program (cropdbid, programdbid, name, abbreviation, objective, leadperson) VALUES ('1', '6', 'P6', 'A. Test', 'Demo', 'Program 6');

INSERT INTO scale (cropdbid, scaledbid) VALUES ('1', '1');

INSERT INTO season (cropdbid, seasondbid, year, season) VALUES ('1', '1', '2013', '2013');
INSERT INTO season (cropdbid, seasondbid, year, season) VALUES ('1', '2', '2011', '2011');
INSERT INTO season (cropdbid, seasondbid, year, season) VALUES ('1', '3', '2014', '2014');
INSERT INTO season (cropdbid, seasondbid, year, season) VALUES ('1', '4', '2013', 'winter 2013');
INSERT INTO season (cropdbid, seasondbid, year, season) VALUES ('1', '5', '2013', 'fall 2013');

INSERT INTO study (cropdbid, trialdbid, locationdbid, studytype, studydbid, name, description, startdate, enddate, active, license, lastupdateversion, lastupdatetimestamp) VALUES ('1', '101', '1', 'Yield study', '1001', 'Study 1', 'Field yield phenotyping study', '1/1/2013', '1/1/2014', true, 'https://creativecommons.org/licenses/by/4.0', '1.1', '01/01/15');
INSERT INTO study (cropdbid, trialdbid, locationdbid, studytype, studydbid, name, description, startdate, enddate, active, license, lastupdateversion, lastupdatetimestamp) VALUES ('1', '101', '1', 'Yield study', '1002', 'Study 2', 'Field yield phenotyping study', '1/1/2014', '1/1/2015', true, 'https://creativecommons.org/licenses/by/4.0', '2.3', '01/01/16');
INSERT INTO study (cropdbid, trialdbid, locationdbid, studytype, studydbid, name, description, startdate, enddate, active, license, lastupdateversion, lastupdatetimestamp) VALUES ('1', '102', '2', 'Crossing Nursery', '1003', 'Study 3', 'Nursery study description', '1/1/2011', '1/1/2012', false, 'https://creativecommons.org/licenses/by/4.0', '0.1', '01/01/14');

INSERT INTO study_additional_info (cropdbid, studydbid, key, value) VALUES ('1', '1001', 'studyObjective', 'Increase yield');
INSERT INTO study_additional_info (cropdbid, studydbid, key, value) VALUES ('1', '1002', 'publications', 'pmid:24039865287545');
INSERT INTO study_additional_info (cropdbid, studydbid, key, value) VALUES ('1', '1002', 'publications', 'pmid:23643517318968');

INSERT INTO study_contact (cropdbid, studydbid, contactdbid) VALUES ('1', '1001', '1');
INSERT INTO study_contact (cropdbid, studydbid, contactdbid) VALUES ('1', '1001', '2');
INSERT INTO study_contact (cropdbid, studydbid, contactdbid) VALUES ('1', '1002', '2');
INSERT INTO study_contact (cropdbid, studydbid, contactdbid) VALUES ('1', '1003', '3');
INSERT INTO study_contact (cropdbid, studydbid, contactdbid) VALUES ('1', '1003', '4');

INSERT INTO study_data_link (cropdbid, studydbid, name, type, url) VALUES ('1', '1001', 'image-archive12.zip', 'Image archive', 'http://data.inra.fr/archive/multi-spect-flowering.zip');
INSERT INTO study_data_link (cropdbid, studydbid, name, type, url) VALUES ('1', '1001', 'image-archive13.zip', 'Image archive', 'http://data.inra.fr/archive/biomass-img.zip');
INSERT INTO study_data_link (cropdbid, studydbid, name, type, url) VALUES ('1', '1002', 'trial-layout.pdf', 'Trial layout documentation', 'http://data.inra.fr/archive/trial-layout.pdf');

INSERT INTO study_season (cropdbid, studydbid, seasondbid) VALUES ('1', '1001', '1');
INSERT INTO study_season (cropdbid, studydbid, seasondbid) VALUES ('1', '1001', '2');
INSERT INTO study_season (cropdbid, studydbid, seasondbid) VALUES ('1', '1002', '2');
INSERT INTO study_season (cropdbid, studydbid, seasondbid) VALUES ('1', '1003', '3');

INSERT INTO study_type (cropdbid, name, description) VALUES ('1', 'Crossing Nursery', 'Description for Nursery study type');
INSERT INTO study_type (cropdbid, name, description) VALUES ('1', 'Yield study', 'Description for yield study type');
INSERT INTO study_type (cropdbid, name, description) VALUES ('1', 'Genotype', 'Description for Genotyping study type');

INSERT INTO taxon_xref (cropdbid, taxondbid, source, rank) VALUES ('1', '2340', 'ncbiTaxon', 'species');
INSERT INTO taxon_xref (cropdbid, taxondbid, source, rank) VALUES ('1', 'E312', 'ciradTaxon', 'species');

INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', '2340', '1');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', 'E312', '1');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', '2340', '2');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', 'E312', '2');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', '2340', '3');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', 'E312', '3');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', '2340', '4');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', 'E312', '4');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', '2340', '5');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', 'E312', '5');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', '2340', '6');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', 'E312', '6');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', '2340', '7');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', 'E312', '7');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', '2340', '8');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', 'E312', '8');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', '2340', '9');
INSERT INTO taxon_xref_germplasm (cropdbid, taxondbid, germplasmdbid) VALUES ('1', 'E312', '9');

INSERT INTO trait (cropdbid, traitdbid) VALUES ('1', '1');

INSERT INTO treatment (cropdbid, observationunitdbid, factor, modality) VALUES ('1', '1', 'water regimen', 'deficit');
INSERT INTO treatment (cropdbid, observationunitdbid, factor, modality) VALUES ('1', '2', 'water regimen', 'deficit');
INSERT INTO treatment (cropdbid, observationunitdbid, factor, modality) VALUES ('1', '5', 'water regimen', 'deficit');
INSERT INTO treatment (cropdbid, observationunitdbid, factor, modality) VALUES ('1', '6', 'water regimen', 'deficit');
INSERT INTO treatment (cropdbid, observationunitdbid, factor, modality) VALUES ('1', '3', 'water regimen', 'normal');
INSERT INTO treatment (cropdbid, observationunitdbid, factor, modality) VALUES ('1', '4', 'water regimen', 'normal');
INSERT INTO treatment (cropdbid, observationunitdbid, factor, modality) VALUES ('1', '7', 'water regimen', 'normal');
INSERT INTO treatment (cropdbid, observationunitdbid, factor, modality) VALUES ('1', '8', 'water regimen', 'normal');

INSERT INTO trial (cropdbid, programdbid, trialdbid, name, startdate, enddate, active, datasetauthorshiplicence, datasetauthorshipdatasetpui) VALUES ('1', '1', '101', 'Peru Yield Trial 1', '1/1/2013', '7/5/2013', false, 'https://creativecommons.org/licenses/by/4.0', 'doi:10.15454/312953986E3');
INSERT INTO trial (cropdbid, programdbid, trialdbid, name, startdate, enddate, active, datasetauthorshiplicence, datasetauthorshipdatasetpui) VALUES ('1', '1', '102', 'Peru Yield Trial 2', '6/1/2014', '1/15/2015', false, 'https://creativecommons.org/licenses/by/4.0', 'doi:10.15454/1234992349');
INSERT INTO trial (cropdbid, programdbid, trialdbid, name, startdate, enddate, active, datasetauthorshiplicence, datasetauthorshipdatasetpui) VALUES ('1', '2', '103', 'Ghana Genotype Trial 1', '5/1/2011', '12/15/2011', false, 'https://creativecommons.org/licenses/by/4.0', 'doi:10.15454/134591245');
INSERT INTO trial (cropdbid, programdbid, trialdbid, name, startdate, enddate, active, datasetauthorshiplicence, datasetauthorshipdatasetpui) VALUES ('1', '3', '104', 'Ghana Yield Trial 1', '7/1/2012', '2/1/2013', false, 'https://creativecommons.org/licenses/by/4.0', 'doi:10.15454/1235919');
INSERT INTO trial (cropdbid, programdbid, trialdbid, name, startdate, enddate, active, datasetauthorshiplicence, datasetauthorshipdatasetpui) VALUES ('1', '3', '105', 'Ghana Yield Trial 2', '8/15/2013', '2/28/2014', false, 'https://creativecommons.org/licenses/by/4.0', 'doi:10.15454/13425915');
INSERT INTO trial (cropdbid, programdbid, trialdbid, name, startdate, enddate, active, datasetauthorshiplicence, datasetauthorshipdatasetpui) VALUES ('1', '3', '106', 'Ghana Yield Trial 3', '9/22/2014', '3/21/2015', true, 'https://creativecommons.org/licenses/by/4.0', 'doi:10.15454/125512251');
INSERT INTO trial (cropdbid, programdbid, trialdbid, name, startdate, enddate, active, datasetauthorshiplicence, datasetauthorshipdatasetpui) VALUES ('1', '4', '107', 'Mozambique Yield Trial', '5/12/2011', '11/30/2011', false, 'https://creativecommons.org/licenses/by/4.0', 'doi:10.15454/34576437');
INSERT INTO trial (cropdbid, programdbid, trialdbid, name, startdate, enddate, active, datasetauthorshiplicence, datasetauthorshipdatasetpui) VALUES ('1', '4', '108', 'Mozambique Genotype Trial', '2/17/2012', '8/21/2012', false, 'https://creativecommons.org/licenses/by/4.0', 'doi:10.15454/34734756');
INSERT INTO trial (cropdbid, programdbid, trialdbid, name, startdate, enddate, active, datasetauthorshiplicence, datasetauthorshipdatasetpui) VALUES ('1', '6', '109', 'Demo Yield Trial', '3/24/2016', '10/21/2016', true, 'https://creativecommons.org/licenses/by/4.0', 'doi:10.15454/35673236');

INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '101', 'publications', 'pmid:239823988');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '101', 'publications', 'pmid:210494013');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '101', 'publications', 'doi:10.2345/GEZG3T23535');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '102', 'publications', 'pmid:245684568');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '102', 'publications', 'pmid:345966399');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '101', 'donorName', 'Donor1');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '101', 'specialProject', 'Project1');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '103', 'donorName', 'Donor2');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '103', 'collaborator', 'NationalPartner1');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '103', 'fundingUSD', '300000');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '104', 'donorName', 'Donor1');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '104', 'specialProject', 'Project2');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '107', 'specialProject', 'Project2');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '107', 'fundingUSD', '1000000');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '108', 'donorName', 'Donor1');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '108', 'collaborator', 'NationalPartner1');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '109', 'fundingUSD', '500000');
INSERT INTO trial_additional_info (cropdbid, trialdbid, key, value) VALUES ('1', '109', 'specialProject', 'Project1');

INSERT INTO trial_contact (cropdbid, trialdbid, contactdbid) VALUES ('1', '101', '4');
INSERT INTO trial_contact (cropdbid, trialdbid, contactdbid) VALUES ('1', '101', '3');
INSERT INTO trial_contact (cropdbid, trialdbid, contactdbid) VALUES ('1', '102', '3');
INSERT INTO trial_contact (cropdbid, trialdbid, contactdbid) VALUES ('1', '103', '1');
INSERT INTO trial_contact (cropdbid, trialdbid, contactdbid) VALUES ('1', '103', '2');

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (contactdbid);
ALTER TABLE ONLY crop
    ADD CONSTRAINT crop_pkey PRIMARY KEY (cropdbid);
ALTER TABLE ONLY germplasm_attribute_category
    ADD CONSTRAINT germplasm_attribute_category_pkey PRIMARY KEY (attributecategorydbid);
ALTER TABLE ONLY germplasm_attribute
    ADD CONSTRAINT germplasm_attribute_pkey PRIMARY KEY (attributedbid);
ALTER TABLE ONLY germplasm
    ADD CONSTRAINT germplasm_pkey PRIMARY KEY (germplasmdbid);
ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (locationdbid);
ALTER TABLE ONLY map
    ADD CONSTRAINT map_pkey PRIMARY KEY (mapdbid);
ALTER TABLE ONLY markerprofile
    ADD CONSTRAINT markerprofile_pkey PRIMARY KEY (markerprofiledbid);
ALTER TABLE ONLY method
    ADD CONSTRAINT method_pkey PRIMARY KEY (methoddbid);
ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observationdbid);
ALTER TABLE ONLY observation_unit
    ADD CONSTRAINT observation_unit_pkey PRIMARY KEY (observationunitdbid);
ALTER TABLE ONLY observation_variable
    ADD CONSTRAINT observation_variable_pkey PRIMARY KEY (observationvariabledbid);
ALTER TABLE ONLY ontology
    ADD CONSTRAINT ontology_pkey PRIMARY KEY (ontologydbid);
ALTER TABLE ONLY program
    ADD CONSTRAINT program_pkey PRIMARY KEY (programdbid);
ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_pkey PRIMARY KEY (sampledbid);
ALTER TABLE ONLY scale
    ADD CONSTRAINT scale_pkey PRIMARY KEY (scaledbid);
ALTER TABLE ONLY season
    ADD CONSTRAINT season_pkey PRIMARY KEY (seasondbid);
ALTER TABLE ONLY study
    ADD CONSTRAINT study_pkey PRIMARY KEY (studydbid);
ALTER TABLE ONLY study_type
    ADD CONSTRAINT study_type_pkey PRIMARY KEY (name);
ALTER TABLE ONLY taxon_xref
    ADD CONSTRAINT taxon_xref_pkey PRIMARY KEY (taxondbid);
ALTER TABLE ONLY trait
    ADD CONSTRAINT trait_pkey PRIMARY KEY (traitdbid);
ALTER TABLE ONLY trial
    ADD CONSTRAINT trial_pkey PRIMARY KEY (trialdbid);
ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY donor
    ADD CONSTRAINT donor_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY donor
    ADD CONSTRAINT donor_germplasmdbid_fkey FOREIGN KEY (germplasmdbid) REFERENCES germplasm(germplasmdbid);
ALTER TABLE ONLY germplasm_attribute
    ADD CONSTRAINT germplasm_attribute_attributecategorydbid_fkey FOREIGN KEY (attributecategorydbid) REFERENCES germplasm_attribute_category(attributecategorydbid);
ALTER TABLE ONLY germplasm_attribute_category
    ADD CONSTRAINT germplasm_attribute_category_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY germplasm_attribute
    ADD CONSTRAINT germplasm_attribute_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY germplasm_attribute_value
    ADD CONSTRAINT germplasm_attribute_value_attributedbid_fkey FOREIGN KEY (attributedbid) REFERENCES germplasm_attribute(attributedbid);
ALTER TABLE ONLY germplasm_attribute_value
    ADD CONSTRAINT germplasm_attribute_value_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY germplasm_attribute_value
    ADD CONSTRAINT germplasm_attribute_value_germplasmdbid_fkey FOREIGN KEY (germplasmdbid) REFERENCES germplasm(germplasmdbid);
ALTER TABLE ONLY germplasm
    ADD CONSTRAINT germplasm_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY location_additional_info
    ADD CONSTRAINT location_additional_info_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY location_additional_info
    ADD CONSTRAINT location_additional_info_locationdbid_fkey FOREIGN KEY (locationdbid) REFERENCES location(locationdbid);
ALTER TABLE ONLY location
    ADD CONSTRAINT location_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY map
    ADD CONSTRAINT map_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY marker
    ADD CONSTRAINT marker_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY markerprofile
    ADD CONSTRAINT markerprofile_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY method
    ADD CONSTRAINT method_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_observationunitdbid_fkey FOREIGN KEY (observationunitdbid) REFERENCES observation_unit(observationunitdbid);
ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_observationvariabledbid_fkey FOREIGN KEY (observationvariabledbid) REFERENCES observation_variable(observationvariabledbid);
ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_seasondbid_fkey FOREIGN KEY (seasondbid) REFERENCES season(seasondbid);
ALTER TABLE ONLY observation_unit
    ADD CONSTRAINT observation_unit_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY observation_unit
    ADD CONSTRAINT observation_unit_germplasmdbid_fkey FOREIGN KEY (germplasmdbid) REFERENCES germplasm(germplasmdbid);
ALTER TABLE ONLY observation_unit
    ADD CONSTRAINT observation_unit_studydbid_fkey FOREIGN KEY (studydbid) REFERENCES study(studydbid);
ALTER TABLE ONLY observation_unit_xref
    ADD CONSTRAINT observation_unit_xref_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY observation_unit_xref
    ADD CONSTRAINT observation_unit_xref_observationunitdbid_fkey FOREIGN KEY (observationunitdbid) REFERENCES observation_unit(observationunitdbid);
ALTER TABLE ONLY observation_variable
    ADD CONSTRAINT observation_variable_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY observation_variable
    ADD CONSTRAINT observation_variable_methoddbid_fkey FOREIGN KEY (methoddbid) REFERENCES method(methoddbid);
ALTER TABLE ONLY observation_variable
    ADD CONSTRAINT observation_variable_ontologydbid_fkey FOREIGN KEY (ontologydbid) REFERENCES ontology(ontologydbid);
ALTER TABLE ONLY observation_variable
    ADD CONSTRAINT observation_variable_scaledbid_fkey FOREIGN KEY (scaledbid) REFERENCES scale(scaledbid);
ALTER TABLE ONLY observation_variable
    ADD CONSTRAINT observation_variable_traitdbid_fkey FOREIGN KEY (traitdbid) REFERENCES trait(traitdbid);
ALTER TABLE ONLY ontology
    ADD CONSTRAINT ontology_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY pedigree
    ADD CONSTRAINT pedigree_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY pedigree
    ADD CONSTRAINT pedigree_germplasmdbid_fkey FOREIGN KEY (germplasmdbid) REFERENCES germplasm(germplasmdbid);
ALTER TABLE ONLY pedigree
    ADD CONSTRAINT pedigree_parent1id_fkey FOREIGN KEY (parent1id) REFERENCES germplasm(germplasmdbid);
ALTER TABLE ONLY pedigree
    ADD CONSTRAINT pedigree_parent2id_fkey FOREIGN KEY (parent2id) REFERENCES germplasm(germplasmdbid);
ALTER TABLE ONLY program
    ADD CONSTRAINT program_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY scale
    ADD CONSTRAINT scale_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY season
    ADD CONSTRAINT season_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY study_additional_info
    ADD CONSTRAINT study_additional_info_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY study_additional_info
    ADD CONSTRAINT study_additional_info_studydbid_fkey FOREIGN KEY (studydbid) REFERENCES study(studydbid);
ALTER TABLE ONLY study_contact
    ADD CONSTRAINT study_contact_contactdbid_fkey FOREIGN KEY (contactdbid) REFERENCES contact(contactdbid);
ALTER TABLE ONLY study_contact
    ADD CONSTRAINT study_contact_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY study_contact
    ADD CONSTRAINT study_contact_studydbid_fkey FOREIGN KEY (studydbid) REFERENCES study(studydbid);
ALTER TABLE ONLY study
    ADD CONSTRAINT study_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY study_data_link
    ADD CONSTRAINT study_data_link_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY study_data_link
    ADD CONSTRAINT study_data_link_studydbid_fkey FOREIGN KEY (studydbid) REFERENCES study(studydbid);
ALTER TABLE ONLY study
    ADD CONSTRAINT study_locationdbid_fkey FOREIGN KEY (locationdbid) REFERENCES location(locationdbid);
ALTER TABLE ONLY study_season
    ADD CONSTRAINT study_season_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY study_season
    ADD CONSTRAINT study_season_seasondbid_fkey FOREIGN KEY (seasondbid) REFERENCES season(seasondbid);
ALTER TABLE ONLY study_season
    ADD CONSTRAINT study_season_studydbid_fkey FOREIGN KEY (studydbid) REFERENCES study(studydbid);
ALTER TABLE ONLY study
    ADD CONSTRAINT study_studytype_fkey FOREIGN KEY (studytype) REFERENCES study_type(name);
ALTER TABLE ONLY study
    ADD CONSTRAINT study_trialdbid_fkey FOREIGN KEY (trialdbid) REFERENCES trial(trialdbid);
ALTER TABLE ONLY study_type
    ADD CONSTRAINT study_type_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY taxon_xref
    ADD CONSTRAINT taxon_xref_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY taxon_xref_germplasm
    ADD CONSTRAINT taxon_xref_germplasm_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY taxon_xref_germplasm
    ADD CONSTRAINT taxon_xref_germplasm_germplasmdbid_fkey FOREIGN KEY (germplasmdbid) REFERENCES germplasm(germplasmdbid);
ALTER TABLE ONLY taxon_xref_germplasm
    ADD CONSTRAINT taxon_xref_germplasm_taxondbid_fkey FOREIGN KEY (taxondbid) REFERENCES taxon_xref(taxondbid);
ALTER TABLE ONLY trait
    ADD CONSTRAINT trait_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY treatment
    ADD CONSTRAINT treatment_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY treatment
    ADD CONSTRAINT treatment_observationunitdbid_fkey FOREIGN KEY (observationunitdbid) REFERENCES observation_unit(observationunitdbid);
ALTER TABLE ONLY trial_additional_info
    ADD CONSTRAINT trial_additional_info_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY trial_additional_info
    ADD CONSTRAINT trial_additional_info_trialdbid_fkey FOREIGN KEY (trialdbid) REFERENCES trial(trialdbid);
ALTER TABLE ONLY trial_contact
    ADD CONSTRAINT trial_contact_contactdbid_fkey FOREIGN KEY (contactdbid) REFERENCES contact(contactdbid);
ALTER TABLE ONLY trial_contact
    ADD CONSTRAINT trial_contact_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY trial_contact
    ADD CONSTRAINT trial_contact_trialdbid_fkey FOREIGN KEY (trialdbid) REFERENCES trial(trialdbid);
ALTER TABLE ONLY trial
    ADD CONSTRAINT trial_cropdbid_fkey FOREIGN KEY (cropdbid) REFERENCES crop(cropdbid);
ALTER TABLE ONLY trial
    ADD CONSTRAINT trial_programdbid_fkey FOREIGN KEY (programdbid) REFERENCES program(programdbid);
