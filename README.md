| ![BrAPI V1 schema](diagram.png)                                  |
| ---------------------------------------------------------------- |
| Work in progress diagram of all the concepts in the Breeding API |

The previous diagram was generated with DbVis from the `schema.sql` imported into
PostgreSQL. The crop entity is not represented here as it is linked to all the
other entities and can make the diagram difficult to read.

Check the [docker/README.md](docker/README.md) to see how to load the schema and
data into a dockerized PostgreSQL server.

Disclaimer:
The data examples are not real and so not coherent.

TODO
- [ ] SQL Schema (see `schema.sql` file)
- [ ] CSV data examples for each table (see `data` folder)
- [ ] SQL JSON queries for each BrAPI casll (see `json-query` folder)
