
SELECT json_build_object(
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
    FROM taxon t
    JOIN taxon_germplasm tg
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
)
FROM germplasm g
JOIN crop c ON c.cropDbId = g.cropDbId;
