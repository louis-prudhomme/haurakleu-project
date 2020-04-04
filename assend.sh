#!/bin/bash
./assemble.sh
curl --upload-file "./avengers.sql" -H "Max-Days: 1" "https://transfer.sh/avengers.sql"
echo ''
