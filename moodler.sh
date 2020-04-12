#!/bin/bash
set -euo pipefail
OUR_NAMES="Marques_Prud’homme"
FULL_SCRIPT_NAME="full_script.sql"
DELIVERY_FOLDER="delivery"
SEPARATE_FOLDER="$DELIVERY_FOLDER/${OUR_NAMES}_separated_scripts"

SEPARATED_SCRIPTS=`find . -maxdepth 1 -name '*.sql' ! '(' -name 'tests.sql' -o -name 'avengers.sql' ')'`

[ -d "$DELIVERY_FOLDER" ] && rm -rf "$DELIVERY_FOLDER"
mkdir -p "$SEPARATE_FOLDER"

./assemble.sh

for script in $SEPARATED_SCRIPTS
do
    cp "$script" "$SEPARATE_FOLDER/${OUR_NAMES}_separated_${script:2}"
done

cp "./report/report.pdf" "./$DELIVERY_FOLDER/$OUR_NAMES.pdf"
cp "./avengers.sql" "./$DELIVERY_FOLDER/${OUR_NAMES}_full_script.sql"
cp "./model/haurakleu-model.png" "./$DELIVERY_FOLDER/${OUR_NAMES}_diagram.png"
zip -r "./$DELIVERY_FOLDER/${OUR_NAMES}_separated_scripts.zip" "$SEPARATE_FOLDER" > /dev/null

rm -rf "$SEPARATE_FOLDER"