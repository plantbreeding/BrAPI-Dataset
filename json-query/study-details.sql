-- JSON output for BrAPI calls:

-- - /brapi/v1/studies/{id}
--   https://github.com/plantbreeding/API/blob/master/Specification/Studies/StudyDetails.md

SELECT json_agg(json_build_object(
  'studyDbId', s.studyDbId,
  'name', s.name,
  'startDate', s.startDate,
  'endDate' , s.endDate,
  'active', s.active,
  'studyType', s.studyType,

  'lastUpdate', json_build_object(
    'version', s.lastUpdateVersion,
    'timestamp', s.lastUpdateTimestamp
  ),

  'programDbId', p.programDbId,
  'programName', p.name,

  'trialDbId', t.trialDbId,
  'trialName', t.name,

  'seasons', array(
    SELECT se.season
    FROM study_season ss
    JOIN season se
      ON se.seasonDbId = ss.seasonDbId
     AND ss.studyDbId = s.studyDbId
  ),

  'location', (
    SELECT json_build_object(
      'locationDbId', l.locationDbId,
      'name', l.name,
      'locationType', l.type,
      'abbreviation', l.abbreviation,
      'countryCode', l.countryCode,
      'countryName', l.countryName,
      'instituteName', l.instituteName,
      'instituteAdress', l.instituteAddress,

      -- Aggregate location_additional_info for the current study into a single json object
      'additionalInfo', (
        SELECT json_object_agg(key, value)
        FROM (
            SELECT
              lai.key AS key,
              CASE WHEN count(lai.value) = 1
                THEN to_json(string_agg(lai.value, '')) -- value as simple text
                ELSE json_agg(lai.value) -- value as array of text
              END AS value
            FROM location_additional_info lai
            WHERE lai.locationDbId = s.locationDbId
            GROUP BY key
        ) ai
      )
    )
    FROM location l
    WHERE s.locationDbId = l.locationDbId
  ),

  'contacts', array(
    SELECT json_build_object(
      'contactDbId', c.contactDbId,
      'name', c.name,
      'instituteName', c.instituteName,
      'email', c.email,
      'type', c.type,
      'orcid', c.orcid
    )
    FROM study_contact sc
    JOIN contact c
      ON c.contactDbId = sc.contactDbId
     AND sc.studyDbId = s.studyDbId
  ),

  'dataLinks', array(
    SELECT json_build_object(
      'name', sdl.name,
      'type', sdl.type,
      'url', sdl.url
    )
    FROM study_data_link sdl
    WHERE sdl.studyDbId = s.studyDbId
  ),

  -- Aggregate study_additional_info for the current study into a single json object
  'additionalInfo', (
    SELECT json_object_agg(key, value)
    FROM (
        SELECT
          sai.key AS key,
          CASE WHEN count(sai.value) = 1
            THEN to_json(string_agg(sai.value, '')) -- value as simple text
            ELSE json_agg(sai.value) -- value as array of text
          END AS value
        FROM study_additional_info sai
        WHERE sai.studyDbId = s.studyDbId
        GROUP BY key
    ) ai
  )
))
FROM study s
LEFT JOIN trial t
  ON t.trialDbId = s.trialDbId
LEFT JOIN program p
  ON p.programDbId = t.programDbId
LEFT JOIN location l
  ON l.locationDbId = s.locationDbId
