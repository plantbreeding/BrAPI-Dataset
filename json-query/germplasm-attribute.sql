-- JSON output for BrAPI calls:

-- - /brapi/v1/attributes 
--   https://github.com/plantbreeding/API/blob/master/Specification/GermplasmAttributes/ListAttributesByAttributeCategoryDbId.md

SELECT json_build_object(
  'attributeDbId', ga.attributeDbId,
  'code', ga.code,
  'uri', ga.uri,
  'name', ga.name,
  'description', ga.description,
  'attributeCategoryDbId', ga.attributeCategoryDbId,
  'attributeCategoryName', gac.attributeCategoryName,
  'datatype', ga.datatype,
  'values', ga.values
)
FROM germplasm_attribute ga
LEFT JOIN germplasm_attribute_category gac
  ON ga.attributeCategoryDbId = gac.attributeCategoryDbId
