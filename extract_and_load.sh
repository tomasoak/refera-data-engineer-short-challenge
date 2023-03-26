#!/bin/bash

# 1: Create dump file from `transactional`  database
PGPASSWORD="password" pg_dump  -U postgres -h transactional -Fc dvdrental > /shared_directory/backup_database.sql

# 2: Wait  `analytics` container to start up
echo "Waiting for analytics container to start up..."
sleep 5

# 3: Load dump file into the `analytics`` database
PGPASSWORD="password" pg_restore -U postgres -h analytics -d analytics < /shared_directory/backup_database.sql
