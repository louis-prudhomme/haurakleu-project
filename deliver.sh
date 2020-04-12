#!/bin/bash
OUR_NAMES="Marques_Prud’homme"
FULL_SCRIPT_NAME="full_script.sql"
DELIVERY_FOLDER="delivery"
SEPARATE_FOLDER="$DELIVERY_FOLDER/separated_scripts"

[ -d "$DELIVERY_FOLDER" ] && rm -rf "$DELIVERY_FOLDER"
mkdir -p "$SEPARATE_FOLDER"

./assemble.sh

cat "./tests.sql" > "./$SEPARATE_FOLDER/${OUR_NAMES}_separated_tests.sql"
cat "./insertion.sql" > "./$SEPARATE_FOLDER/${OUR_NAMES}_separated_inserts.sql"
cat "./drop_it.sql" "./creation.sql" "./functions.sql" "./procedures.sql" "./triggers.sql" > "./$SEPARATE_FOLDER/${OUR_NAMES}_separated_creation.sql"

cp "./report/report.pdf" "./$DELIVERY_FOLDER/$OUR_NAMES.pdf"
cp "./avengers.sql" "./$DELIVERY_FOLDER/${OUR_NAMES}_full_script.sql"
zip -r "./$DELIVERY_FOLDER/separated_scripts.zip" "$SEPARATE_FOLDER"

rm -rf "$SEPARATE_FOLDER"