--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-06-15 20:25:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2275 (class 1262 OID 16393)
-- Dependencies: 2274
-- Name: brapi_v1; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE brapi_v1 IS 'BrAPI test dataset.';


--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16497)
-- Name: attribute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE attribute (
    "attributeDbId" text NOT NULL
);


--
-- TOC entry 186 (class 1259 OID 16402)
-- Name: call; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE call (
    "call" text NOT NULL,
    "datatypes" text,
    "methods" text
);


--
-- TOC entry 199 (class 1259 OID 16507)
-- Name: crop; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE crop (
    "_id" integer NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 16410)
-- Name: donor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE donor (
    "donorAccessionNumber" text,
    "donorInstituteCode" text,
    "donorGermplasmPUI" text,
    "_id" integer NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 16394)
-- Name: germplasm; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE germplasm (
    "germplasmDbId" text NOT NULL,
    "defaultDisplayName" text,
    "accessionNumber" text,
    "germplasmName" text,
    "germplasmPUI" text,
    "pedigree" text,
    "seedSource" text,
    "commonCropName" text,
    "instituteCode" text,
    "instituteName" text,
    "biologicalStatusOfAccessionCode" text,
    "countryOfOriginCode" text,
    "genus" text,
    "species" text,
    "speciesAuthority" text,
    "subtaxa" text,
    "subtaxaAuthority" text,
    "synonyms" text,
    "typeOfGermplasmStorageCode" text,
    "acquisitionDate" timestamp without time zone
);


--
-- TOC entry 188 (class 1259 OID 16418)
-- Name: germplasm_donor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE germplasm_donor (
    "germplasmDbId" text NOT NULL,
    "donor" integer NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 16502)
-- Name: location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE location (
    "locationDbId" text NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 16512)
-- Name: map; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE map (
    "mapDbId" text NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 16459)
-- Name: marker; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE marker (
    "markerDbId" text NOT NULL,
    "defaultDisplayName" text,
    "type" text,
    "synonyms" text,
    "refAlt" text,
    "analysisMethods" text
);


--
-- TOC entry 201 (class 1259 OID 16517)
-- Name: markerprofile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE markerprofile (
    "markerProfileDbId" text NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 16532)
-- Name: observation_unit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE observation_unit (
    "observationUnitDbId" text NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 16527)
-- Name: observation_variable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE observation_variable (
    "observationVariableDbId" text NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 16436)
-- Name: pedegree; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pedegree (
    "germplasmDbId" text NOT NULL,
    "pedegree" text,
    "parent1Id" text NOT NULL,
    "parent2Id" text NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 16537)
-- Name: phenotype; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE phenotype (
    "_id" text NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 16492)
-- Name: plot_layout; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE plot_layout (
    "_id" integer NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 16482)
-- Name: program; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE program (
    "programDbId" text NOT NULL
);


--
-- TOC entry 191 (class 1259 OID 16467)
-- Name: sample; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sample (
    "sampleId" text NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 16487)
-- Name: season; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE season (
    "seasonDbId" text NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 16472)
-- Name: study; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE study (
    "studyDbId" text NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 16522)
-- Name: trait; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trait (
    "traitDbId" text NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 16477)
-- Name: trial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trial (
    "trialDbId" text NOT NULL
);


--
-- TOC entry 2261 (class 0 OID 16497)
-- Dependencies: 197
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: -
--

COPY attribute ("attributeDbId") FROM stdin;
\.


--
-- TOC entry 2250 (class 0 OID 16402)
-- Dependencies: 186
-- Data for Name: call; Type: TABLE DATA; Schema: public; Owner: -
--

COPY call (call, datatypes, methods) FROM stdin;
\.


--
-- TOC entry 2263 (class 0 OID 16507)
-- Dependencies: 199
-- Data for Name: crop; Type: TABLE DATA; Schema: public; Owner: -
--

COPY crop (_id) FROM stdin;
\.


--
-- TOC entry 2251 (class 0 OID 16410)
-- Dependencies: 187
-- Data for Name: donor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY donor ("donorAccessionNumber", "donorInstituteCode", "donorGermplasmPUI", _id) FROM stdin;
\.


--
-- TOC entry 2249 (class 0 OID 16394)
-- Dependencies: 185
-- Data for Name: germplasm; Type: TABLE DATA; Schema: public; Owner: -
--

COPY germplasm ("germplasmDbId", "defaultDisplayName", "accessionNumber", "germplasmName", "germplasmPUI", pedigree, "seedSource", "commonCropName", "instituteCode", "instituteName", "biologicalStatusOfAccessionCode", "countryOfOriginCode", genus, species, "speciesAuthority", subtaxa, "subtaxaAuthority", synonyms, "typeOfGermplasmStorageCode", "acquisitionDate") FROM stdin;
\.


--
-- TOC entry 2252 (class 0 OID 16418)
-- Dependencies: 188
-- Data for Name: germplasm_donor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY germplasm_donor ("germplasmDbId", donor) FROM stdin;
\.


--
-- TOC entry 2262 (class 0 OID 16502)
-- Dependencies: 198
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: -
--

COPY location ("locationDbId") FROM stdin;
\.


--
-- TOC entry 2264 (class 0 OID 16512)
-- Dependencies: 200
-- Data for Name: map; Type: TABLE DATA; Schema: public; Owner: -
--

COPY map ("mapDbId") FROM stdin;
\.


--
-- TOC entry 2254 (class 0 OID 16459)
-- Dependencies: 190
-- Data for Name: marker; Type: TABLE DATA; Schema: public; Owner: -
--

COPY marker ("markerDbId", "defaultDisplayName", type, synonyms, "refAlt", "analysisMethods") FROM stdin;
\.


--
-- TOC entry 2265 (class 0 OID 16517)
-- Dependencies: 201
-- Data for Name: markerprofile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY markerprofile ("markerProfileDbId") FROM stdin;
\.


--
-- TOC entry 2268 (class 0 OID 16532)
-- Dependencies: 204
-- Data for Name: observation_unit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY observation_unit ("observationUnitDbId") FROM stdin;
\.


--
-- TOC entry 2267 (class 0 OID 16527)
-- Dependencies: 203
-- Data for Name: observation_variable; Type: TABLE DATA; Schema: public; Owner: -
--

COPY observation_variable ("observationVariableDbId") FROM stdin;
\.


--
-- TOC entry 2253 (class 0 OID 16436)
-- Dependencies: 189
-- Data for Name: pedegree; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pedegree ("germplasmDbId", pedegree, "parent1Id", "parent2Id") FROM stdin;
\.


--
-- TOC entry 2269 (class 0 OID 16537)
-- Dependencies: 205
-- Data for Name: phenotype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY phenotype (_id) FROM stdin;
\.


--
-- TOC entry 2260 (class 0 OID 16492)
-- Dependencies: 196
-- Data for Name: plot_layout; Type: TABLE DATA; Schema: public; Owner: -
--

COPY plot_layout (_id) FROM stdin;
\.


--
-- TOC entry 2258 (class 0 OID 16482)
-- Dependencies: 194
-- Data for Name: program; Type: TABLE DATA; Schema: public; Owner: -
--

COPY program ("programDbId") FROM stdin;
\.


--
-- TOC entry 2255 (class 0 OID 16467)
-- Dependencies: 191
-- Data for Name: sample; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sample ("sampleId") FROM stdin;
\.


--
-- TOC entry 2259 (class 0 OID 16487)
-- Dependencies: 195
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: -
--

COPY season ("seasonDbId") FROM stdin;
\.


--
-- TOC entry 2256 (class 0 OID 16472)
-- Dependencies: 192
-- Data for Name: study; Type: TABLE DATA; Schema: public; Owner: -
--

COPY study ("studyDbId") FROM stdin;
\.


--
-- TOC entry 2266 (class 0 OID 16522)
-- Dependencies: 202
-- Data for Name: trait; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trait ("traitDbId") FROM stdin;
\.


--
-- TOC entry 2257 (class 0 OID 16477)
-- Dependencies: 193
-- Data for Name: trial; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trial ("trialDbId") FROM stdin;
\.


--
-- TOC entry 2110 (class 2606 OID 16501)
-- Name: attribute attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY ("attributeDbId");


--
-- TOC entry 2088 (class 2606 OID 16409)
-- Name: call call_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY call
    ADD CONSTRAINT call_pkey PRIMARY KEY (call);


--
-- TOC entry 2114 (class 2606 OID 16511)
-- Name: crop crop_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY crop
    ADD CONSTRAINT crop_pkey PRIMARY KEY (_id);


--
-- TOC entry 2090 (class 2606 OID 16417)
-- Name: donor donors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY donor
    ADD CONSTRAINT donors_pkey PRIMARY KEY (_id);


--
-- TOC entry 2092 (class 2606 OID 16425)
-- Name: germplasm_donor germplasm_donor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY germplasm_donor
    ADD CONSTRAINT germplasm_donor_pkey PRIMARY KEY (donor, "germplasmDbId");


--
-- TOC entry 2086 (class 2606 OID 16401)
-- Name: germplasm germplasm_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY germplasm
    ADD CONSTRAINT germplasm_pkey PRIMARY KEY ("germplasmDbId");


--
-- TOC entry 2112 (class 2606 OID 16506)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY ("locationDbId");


--
-- TOC entry 2116 (class 2606 OID 16516)
-- Name: map map_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY map
    ADD CONSTRAINT map_pkey PRIMARY KEY ("mapDbId");


--
-- TOC entry 2096 (class 2606 OID 16463)
-- Name: marker marker_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY marker
    ADD CONSTRAINT marker_pkey PRIMARY KEY ("markerDbId");


--
-- TOC entry 2118 (class 2606 OID 16521)
-- Name: markerprofile markerprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY markerprofile
    ADD CONSTRAINT markerprofile_pkey PRIMARY KEY ("markerProfileDbId");


--
-- TOC entry 2124 (class 2606 OID 16536)
-- Name: observation_unit observation_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observation_unit
    ADD CONSTRAINT observation_unit_pkey PRIMARY KEY ("observationUnitDbId");


--
-- TOC entry 2122 (class 2606 OID 16531)
-- Name: observation_variable observation_variable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY observation_variable
    ADD CONSTRAINT observation_variable_pkey PRIMARY KEY ("observationVariableDbId");


--
-- TOC entry 2094 (class 2606 OID 16443)
-- Name: pedegree pedegree_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedegree
    ADD CONSTRAINT pedegree_pkey PRIMARY KEY ("germplasmDbId");


--
-- TOC entry 2126 (class 2606 OID 16541)
-- Name: phenotype phenotype_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY phenotype
    ADD CONSTRAINT phenotype_pkey PRIMARY KEY (_id);


--
-- TOC entry 2108 (class 2606 OID 16496)
-- Name: plot_layout plot_layout_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plot_layout
    ADD CONSTRAINT plot_layout_pkey PRIMARY KEY (_id);


--
-- TOC entry 2104 (class 2606 OID 16486)
-- Name: program program_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program
    ADD CONSTRAINT program_pkey PRIMARY KEY ("programDbId");


--
-- TOC entry 2098 (class 2606 OID 16471)
-- Name: sample sample_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_pkey PRIMARY KEY ("sampleId");


--
-- TOC entry 2106 (class 2606 OID 16491)
-- Name: season season_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY season
    ADD CONSTRAINT season_pkey PRIMARY KEY ("seasonDbId");


--
-- TOC entry 2100 (class 2606 OID 16476)
-- Name: study study_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY study
    ADD CONSTRAINT study_pkey PRIMARY KEY ("studyDbId");


--
-- TOC entry 2120 (class 2606 OID 16526)
-- Name: trait trait_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trait
    ADD CONSTRAINT trait_pkey PRIMARY KEY ("traitDbId");


--
-- TOC entry 2102 (class 2606 OID 16481)
-- Name: trial trial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trial
    ADD CONSTRAINT trial_pkey PRIMARY KEY ("trialDbId");


--
-- TOC entry 2128 (class 2606 OID 16431)
-- Name: germplasm_donor donor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY germplasm_donor
    ADD CONSTRAINT donor FOREIGN KEY (donor) REFERENCES donor(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2127 (class 2606 OID 16426)
-- Name: germplasm_donor germplasm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY germplasm_donor
    ADD CONSTRAINT germplasm FOREIGN KEY ("germplasmDbId") REFERENCES germplasm("germplasmDbId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2129 (class 2606 OID 16444)
-- Name: pedegree germplasm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedegree
    ADD CONSTRAINT germplasm FOREIGN KEY ("germplasmDbId") REFERENCES germplasm("germplasmDbId");


--
-- TOC entry 2130 (class 2606 OID 16449)
-- Name: pedegree parent1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedegree
    ADD CONSTRAINT parent1 FOREIGN KEY ("parent1Id") REFERENCES germplasm("germplasmDbId");


--
-- TOC entry 2131 (class 2606 OID 16454)
-- Name: pedegree parent2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedegree
    ADD CONSTRAINT parent2 FOREIGN KEY ("parent2Id") REFERENCES germplasm("germplasmDbId");


-- Completed on 2017-06-15 20:25:46

--
-- PostgreSQL database dump complete
--
