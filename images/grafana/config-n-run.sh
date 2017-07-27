#!/bin/bash

./run.sh "${@}" &
timeout 10 bash -c "until </dev/tcp/localhost/3000; do sleep 1; done"

curl -s -H "Content-Type: application/json" -X POST http://admin:admin@localhost:3000/api/datasources -d @- <<EOF
{"name":"SA","type":"prometheus","url":"http://prometheus:9090","access":"proxy","jsonData":{},"secureJsonFields":{},"isDefault":true}
EOF

pkill grafana-server
timeout 10 bash -c "while </dev/tcp/localhost/3000; do sleep 1; done"

# Install any plugins required now that the datasource has been created.
# This is done only after the datasource is installed otherwise the create above
# will try to run the curl while the grafana server is restarting.
export GF_INSTALL_PLUGINS: grafana-piechart-panel

exec ./run.sh "${@}"