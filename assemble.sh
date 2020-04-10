#!/bin/bash
# this script is meant to assemble all the different scripts into one
cat drop_it.sql creation.sql functions.sql procedures.sql triggers.sql insertion.sql > avengers.sql
cat tests.sql >> avengers.sql
