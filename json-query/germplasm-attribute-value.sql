-- JSON output for BrAPI calls:

-- - /brapi/v1/germplasm/{id}/attributes 
--   https://github.com/plantbreeding/API/blob/master/Specification/GermplasmAttributes/GermplasmAttributeValuesByGermplasmDbId.md

SELECT json_build_object(
  'germplasmDbId', g.germplasmDbId,
  'data', array(
    SELECT json_build_object(
      'attributeDbId', ga.attributeDbId,
      'attributeName', ga.name,
      'attributeCode', ga.code,
      'value', gav.value,
      'determinedDate', gav.determinedDate
    )
    FROM germplasm_attribute ga
    JOIN germplasm_attribute_value gav
      ON gav.attributeDbId = ga.attributeDbId
     AND gav.germplasmDbId = g.germplasmDbId
  )
)
FROM germplasm g

