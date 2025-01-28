#!/bin/bash

# Set default values for environment variables if they are not already set

: "${HABBO_SERVER_IP_BIND:=127.0.0.1}"
: "${HABBO_SERVER_PORT:=12321}"
: "${HABBO_SERVER_LIMIT_BANDWIDTH:=false}"
: "${HABBO_SERVER_LIMIT_BANDWIDTH_AMOUNT:=40960}"
: "${HABBO_SERVER_RCON_IP_BIND:=127.0.0.1}"
: "${HABBO_SERVER_RCON_PORT:=12309}"
: "${HABBO_SERVER_MUS_IP_BIND:=127.0.0.1}"
: "${HABBO_SERVER_MUS_PORT:=12322}"
: "${HABBO_DATABASE_HOST:=127.0.0.1}"
: "${HABBO_DATABASE_PORT:=3306}"
: "${HABBO_DATABASE_USERNAME:=havana}"
: "${HABBO_DATABASE_PASSWORD:=changeme}" # Default value
: "${HABBO_DATABASE_NAME:=havana}"
: "${HABBO_SERVER_LOG_RECEIVED_PACKETS:=false}"
: "${HABBO_SERVER_LOG_SENT_PACKETS:=false}"
: "${HABBO_SERVER_DEBUG:=false}"

# Generate the .ini file directly
cat <<EOF > /data/server.ini
[Global]
server.bind = $HABBO_SERVER_IP_BIND
server.port = $HABBO_SERVER_PORT

[Server]
server.port = $HABBO_SERVER_PORT
server.limit.bandwidth = $HABBO_SERVER_LIMIT_BANDWIDTH
server.limit.bandwidth.amount = $HABBO_SERVER_LIMIT_BANDWIDTH_AMOUNT

[Rcon]
rcon.bind = $HABBO_SERVER_RCON_IP_BIND
rcon.port = $HABBO_SERVER_RCON_PORT

[Mus]
mus.bind = $HABBO_SERVER_MUS_IP_BIND
mus.port = $HABBO_SERVER_MUS_PORT

[Database]
mysql.hostname = $HABBO_DATABASE_HOST
mysql.port = $HABBO_DATABASE_PORT
mysql.username = $HABBO_DATABASE_USERNAME
mysql.password = $HABBO_DATABASE_PASSWORD
mysql.database = $HABBO_DATABASE_NAME

[Logging]
log.received.packets = $HABBO_SERVER_LOG_RECEIVED_PACKETS
log.sent.packets = $HABBO_SERVER_LOG_SENT_PACKETS

[Console]
debug = $HABBO_SERVER_DEBUG
EOF

echo "[level:INFO][docker-habbo-web] Configuration file generated"