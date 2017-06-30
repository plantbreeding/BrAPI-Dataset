-- JSON output for BrAPI calls:

-- - /brapi/v1/locations
--   https://github.com/plantbreeding/API/blob/master/Specification/Locations/ListLocations.md

-- - /brapi/v1/locations/{id}
--   https://github.com/plantbreeding/API/blob/master/Specification/Locations/LocationDetails.md

SELECT json_agg(json_build_object(
  'locationDbId', l.locationDbId,
  'name', l.name,
  'locationType', l.type,
  'abbreviation', l.abbreviation,

  'countryCode', l.countryCode,
  'countryName', l.countryName,

  'instituteName', l.instituteName,
  'instituteAdress', l.instituteAddress,

  'latitude', l.latitude,
  'longitude', l.longitude,
  'altitude', l.altitude,

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
        WHERE lai.locationDbId = l.locationDbId
        GROUP BY key
    ) ai
  )
))
FROM location l
