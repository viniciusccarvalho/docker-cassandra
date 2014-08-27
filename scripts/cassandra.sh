#!/bin/bash




/cassandra/bin/cassandra -f

USER=${CASSANDRA_USERNAME:-cassandra}
PASS=${CASSANDRA_PASSWORD:-$(pwgen -s -1 16)}

sed -e 's_\$USERNAME\$_${USER}_' -i users.csql
sed -e 's_\$PASSWORD$_${PASS}_' -i users.csql

