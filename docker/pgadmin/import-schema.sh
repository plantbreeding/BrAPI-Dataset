#!/bin/sh
PGPASSWORD=password psql -h postgres -U postgres postgres -f /brapi-dataset/schema.sql
