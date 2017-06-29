-- JSON output for BrAPI calls:

-- - /brapi/v1/studies
--   https://github.com/plantbreeding/API/blob/master/Specification/Studies/ListStudySummaries.md

-- - /brapi/v1/studies-search
--   https://github.com/plantbreeding/API/blob/master/Specification/Studies/SearchStudies.md

SELECT json_build_object(
  'studyDbId', s.studyDbId,
  'name', s.name,
  'trialDbId', t.trialDbId,
  'trialName', t.name,
  'studyType', s.studyType,
  'seasons', array(
    SELECT ss.seasonDbId
    FROM study_season ss
    WHERE ss.studyDbId = s.studyDbId
  ),
  'locationDbId', l.locationDbId,
  'locationName', l.name,
  'programDbId', p.programDbId,
  'programName', p.name,
  'startDate', s.startDate,
  'endDate' , s.endDate,
  'active', s.active,

  -- Aggregate study_additional_info for the current study into a single json object
  'additionalInfo', (
    SELECT json_object_agg(key, value)
    FROM (
        SELECT
          sai.key AS key, -- info key
          CASE WHEN count(sai.value)=1
            THEN to_json(string_agg(sai.value, '')) -- info as simple text
            ELSE json_agg(sai.value) -- info value as array of text
          END AS value
        FROM study_additional_info sai
        WHERE sai.studyDbId = s.studyDbId
        GROUP BY key
    ) ai
  )
)
FROM study s
LEFT JOIN trial t
  ON t.trialDbId = s.trialDbId
LEFT JOIN program p
  ON p.programDbId = t.programDbId
LEFT JOIN location l
  ON l.locationDbId = s.locationDbId
