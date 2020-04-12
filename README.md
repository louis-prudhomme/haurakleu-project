# Haurakleu Project

This is our Advanced Databases project.

# Execution order

## Manual order 

1. Drop.sql
2. Creation.sql
3. Functions.sql
4. Procedures.sql
5. Triggers.sql
6. Insertion.sql
7. Tests.sql

## Automated assembly

The `assemble.sh` script is meant to assemble all the scripts into one, that will be named `avangers.sql`.

The `assend.sh` script basically does the same as `assemble.sh`, except that it also sends the resulting `avengers.sql` to [transfer.sh](https://transfer.sh/) (when the website is up and running) and will return the URL.

## Automated delivery

The `moodler.sh` script creates and populates the delivery folder.