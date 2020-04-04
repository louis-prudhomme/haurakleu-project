#!/bin/bash
cat drop_it.sql script_creation.sql functions.sql procedures.sql triggers.sql script_insertion.sql > avengers.sql
cat functions.sql >> avengers.sql
cat test_functions.sql >> avengers.sql


