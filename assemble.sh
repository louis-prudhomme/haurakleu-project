#!/bin/bash
cat drop_it.sql creation.sql functions.sql procedures.sql triggers.sql insertion.sql > avengers.sql
cat functions.sql >> avengers.sql
cat test_functions.sql >> avengers.sql


