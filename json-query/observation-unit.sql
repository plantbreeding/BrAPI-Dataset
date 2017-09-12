-- JSON output for BrAPI calls,

-- - /brapi/v1/phenotypes-search
--   https,//github.com/plantbreeding/API/blob/master/Specification/Phenotypes/PhenotypeSearch.md

SELECT json_agg(json_build_object(
  'observationUnitDbId', ou.observationUnitDbId,
  'observationLevel', ou.observationLevel,
  'observationLevels', ou.observationLevels,
  'plotNumber', ou.plotNumber,
  'plantNumber' , ou.plantNumber,
  'blockNumber' , ou.blockNumber,
  'replicate', ou.replicate,
  'observationUnitName', ou.name,
  'germplasmDbId', g.germplasmDbId,
  'germplasmName', g.germplasmName,
  'studyDbId', s.studyDbId,
  'studyName', s.name,
  'studyLocationDbId', l.locationDbId,
  'studyLocation', l.name,
  'programName', p.name,
  'X', ou.X,
  'Y', ou.Y,
  'entryType', ou.entryType,
  'entryNumber', ou.entryNumber,
  'treatments', array(
    SELECT json_build_object(
      'factor', tre.factor,
      'modality', tre.modality
    )
    FROM treatment tre
    WHERE tre.observationUnitDbId = ou.observationUnitDbId
  ),
  'observationUnitXref', array(
    SELECT json_build_object(
      'source', xref.source,
      'id', xref.id
    )
    FROM observation_unit_xref xref
    WHERE xref.observationUnitDbId = ou.observationUnitDbId
  ),
  'observations', array(
    SELECT json_build_object(
      'observationDbId', o.observationDbId,
      'observationVariableDbId', v.observationVariableDbId,
      'observationVariableName', v.observationVariableName,
      'observationTimeStamp', o.observationTimeStamp,
      'season', se.season,
      'collector', o.collector,
      'value', o.value
    )
    FROM observation o
    JOIN observation_variable v
      ON v.observationVariableDbId = o.observationVariableDbId
    LEFT JOIN season se
      ON se.seasonDbId = o.seasonDbId
    WHERE o.observationUnitDbId = ou.observationUnitDbId
  )))
FROM observation_unit ou
JOIN germplasm g
  ON g.germplasmDbId = ou.germplasmDbId
JOIN study s
  ON s.studyDbId = ou.studyDbId
JOIN location l
  ON l.locationDbId = s.locationDbId
JOIN trial t
  ON t.trialDbId = s.trialDbId
JOIN program p
  ON p.programDbId = t.programDbId
