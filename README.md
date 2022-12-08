# Template for running graph-node

First follow the instructions here, but don't use the example command to start the graph-node from there:

https://github.com/graphprotocol/graph-node#running-a-local-graph-node

Then use this template to actually launch the node.  The start.sh and stop.sh scripts make it easier to manage, as well as the config.ini file to manage settings.
This template will run the graph-node in the background and maintain the log file locally so you can easily find/read it.


## Postgres Errors

### If you get 'db error: FATAL: password authentication failed for user "postgres".....'

sudo to your servers 'postgres' user and run
```
initdb -D .postgres

pg_ctl -D .postgres -l logfile start

createdb graph-node
```
[More info here.](https://stackoverflow.com/questions/11919391/postgresql-error-fatal-role-username-does-not-exist)

### If you get 'fe_sendauth: no password supplied'

Switch to sudo user and edit 'pg_hba.conf' in root postgres directory. Edit 'pg_hba.conf' file to 'trust' ipv4 and ipv6 connections. This ignores the password requirement for local connections. [More Info Here.](https://dba.stackexchange.com/questions/83164/postgresql-remove-password-requirement-for-user-postgres)

