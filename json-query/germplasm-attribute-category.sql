-- JSON output for BrAPI calls:

-- - /brapi/v1/attributes/categories 
--   https://github.com/plantbreeding/API/blob/master/Specification/GermplasmAttributes/ListAttributeCategories.md

SELECT json_build_object(
  'attributeCategoryDbId', gac.attributeCategoryDbId,
  'name', gac.attributeCategoryName
)
FROM germplasm_attribute_category gac
