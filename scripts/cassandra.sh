#!/bin/bash

USER=${CASSANDRA_USERNAME:-mongo}
PASS=${CASSANDRA_PASSWORD:-$(pwgen -s -1 16)}

sed -e 's_\$USERNAME\$_${USER}_' -i users.csql
sed -e 's_\$PASSWORD$_${PASS}_' -i users.csql

/cassandra/bin/cassandra
