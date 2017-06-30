-- JSON output for BrAPI calls:

-- - /brapi/v1/programs
--   https://github.com/plantbreeding/API/blob/master/Specification/Programs/ListPrograms.md

-- - /brapi/v1/programs-search
--   https://github.com/plantbreeding/API/blob/master/Specification/Programs/ProgramSearch.md

SELECT json_agg(json_build_object(
  'programDbId', p.programDbId,
  'name', p.name,
  'abbreviation', p.abbreviation,
  'objective', p.objective,
  'leadPerson', p.leadPerson
))
FROM program p
