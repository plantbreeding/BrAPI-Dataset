-- JSON output for BrAPI calls:

-- - /brapi/v1/germplasm-search
--   https://github.com/plantbreeding/API/blob/master/Specification/Germplasm/GermplasmSearchPOST.md
--   https://github.com/plantbreeding/API/blob/master/Specification/Germplasm/GermplasmSearchGET.md

-- - /brapi/v1/germplasm/{id}
--   https://github.com/plantbreeding/API/blob/master/Specification/Germplasm/GermplasmDetailsByGermplasmDbId.md

SELECT json_agg(json_build_object(
  'germplasmDbId', g.germplasmDbId,
  'germplasmPUI', g.germplasmPUI,
  'germplasmName', g.germplasmName,
  'defaultDisplayName', g.defaultDisplayName,
  'accessionNumber', g.accessionNumber,
  'pedigree', g.pedigree,
  'germplasmSeedSource', g.seedSource,
  'synonyms', g.synonyms,
  'commonCropName', c.commonName,
  'instituteCode', g.instituteCode,
  'instituteName', g.instituteName,
  'biologicalStatusOfAccessionCode', g.biologicalStatusOfAccessionCode,
  'countryOfOriginCode', g.countryOfOriginCode,
  'typeOfGermplasmStorageCode', g.typeOfGermplasmStorageCode,
  'genus', g.genus,
  'species', g.species,
  'taxonIds', array(
    SELECT json_build_object(
      'id', t.taxonDbId,
      'source', t.source,
      'rank', t.rank
    )
    FROM taxon_xref t
    JOIN taxon_xref_germplasm tg
      ON tg.taxonDbId = t.taxonDbId
      AND tg.germplasmDbId = g.germplasmDbId
  ),
  'speciesAuthority', g.speciesAuthority,
  'subtaxa', g.subtaxa,
  'subtaxaAuthority', g.subtaxaAuthority,
  'donors', array(
    SELECT json_build_object(
      'donorAccessionNumber', d.donorAccessionNumber,
      'donorInstituteCode', d.donorInstituteCode,
      'donorGermplasmPUI', d.donorGermplasmPUI
    )
    FROM donor d
    WHERE d.germplasmDbId = g.germplasmDbId
  ),
  'acquisitionDate', g.acquisitionDate
))
FROM germplasm g
JOIN crop c ON c.cropDbId = g.cropDbId;
