#!/bin/bash
cat drop_it.sql script_creation.sql functions.sql triggers.sql script_insertion.sql > avengers.sql 
cat functions.sql >> avengers.sql
curl --upload-file "./avengers.sql" -H "Max-Days: 1" "https://transfer.sh/avengers.sql"
echo ''


