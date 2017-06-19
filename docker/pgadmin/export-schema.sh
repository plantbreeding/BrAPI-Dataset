#!/bin/sh
PGPASSWORD=password pg_dump -h postgres -U postgres postgres -v -c -s -f /brapi-dataset/dump.sql
