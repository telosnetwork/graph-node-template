#!/bin/bash

./stop.sh

# change as appropriate for different db name/user

psql -U postgres -h localhost -c 'drop database graphnode'
psql -U postgres -h localhost -c 'create database graphnode'
psql -U postgres -h localhost -c 'grant all privileges on database graphnode to graph'
psql -U postgres -h localhost graphnode -c 'create extension pg_trgm'
psql -U postgres -h localhost graphnode -c 'create extension pg_stat_statements'
psql -U postgres -h localhost graphnode -c 'create extension btree_gist'
psql -U postgres -h localhost graphnode -c 'create extension postgres_fdw'
psql -U postgres -h localhost graphnode -c 'grant usage on foreign data wrapper postgres_fdw to graph'

./start.sh
tail -f graph-node-template.log
