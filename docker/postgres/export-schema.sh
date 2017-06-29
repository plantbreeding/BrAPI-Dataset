#!/bin/sh
pg_dump -U postgres -v -c -s -f /brapi-dataset/dump.sql
