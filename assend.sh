#!/bin/bash
# this script is meant to assemble the scripts into one, and upload the result for VM use.
./assemble.sh
curl --upload-file "./avengers.sql" -H "Max-Days: 1" "https://transfer.sh/avengers.sql"
echo ''
