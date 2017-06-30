This repository contains a SQL schema (`schema.sql` file) and CSV Dataset
(`data/csv` folder) representing the concepts of the Breeding API.

The CSV dataset can be integrated in a PostgreSQL database and exported as JSON
with the queries inside the `json-query` folder. The resulting JSON is available
in the `data/json` folder.

From the PostgreSQL database, you can also generate the EDR diagram using tools
like [DbVis](https://www.dbvis.com/). The resulting diagram is available in the
`diagram.png` file:

| ![BrAPI V1 schema](diagram.png)                                  |
| ---------------------------------------------------------------- |
| Work in progress diagram of all the concepts in the Breeding API |

Check the [docker/README.md](docker/README.md) to see how to load the schema and
data into a dockerized PostgreSQL server.

Disclaimer:
The data examples are not real and so not coherent.

TODO
- [ ] SQL Schema (see `schema.sql` file)
- [ ] CSV data examples for each table (see `data` folder)
- [ ] SQL JSON queries for each BrAPI casll (see `json-query` folder)
