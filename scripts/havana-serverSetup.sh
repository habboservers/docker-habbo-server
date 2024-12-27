#!/bin/bash

# Set default values for environment variables if they are not already set
HABBO_SERVER_IP_BIND=${HABBO_SERVER_IP_BIND:-127.0.0.1}
HABBO_SERVER_PORT=${HABBO_SERVER_PORT:-12321}
HABBO_SERVER_LIMIT_BANDWIDTH=${HABBO_SERVER_LIMIT_BANDWIDTH:-false}
HABBO_SERVER_LIMIT_BANDWIDTH_AMOUNT=${HABBO_SERVER_LIMIT_BANDWIDTH_AMOUNT:-40960}
HABBO_SERVER_RCON_IP_BIND=${HABBO_SERVER_RCON_IP_BIND:-127.0.0.1}
HABBO_SERVER_RCON_PORT=${HABBO_SERVER_RCON_PORT:-12309}
HABBO_SERVER_MUS_IP_BIND=${HABBO_SERVER_MUS_IP_BIND:-127.0.0.1}
HABBO_SERVER_MUS_PORT=${HABBO_SERVER_MUS_PORT:-12322}
HABBO_MYSQL_HOST=${HABBO_MYSQL_HOST:-127.0.0.1}
HABBO_MYSQL_PORT=${HABBO_MYSQL_PORT:-3306}
HABBO_MYSQL_USERNAME=${HABBO_MYSQL_USERNAME:-havana}
HABBO_MYSQL_PASSWORD=${HABBO_MYSQL_PASSWORD:-changeme} # Default value
HABBO_MYSQL_DATABASE=${HABBO_MYSQL_DATABASE:-havana}
HABBO_SERVER_LOG_RECEIVED_PACKETS=${HABBO_SERVER_LOG_RECEIVED_PACKETS:-false}
HABBO_SERVER_LOG_SENT_PACKETS=${HABBO_SERVER_LOG_SENT_PACKETS:-false}
HABBO_SERVER_DEBUG=${HABBO_SERVER_DEBUG:-false}

# Fail if HABBO_MYSQL_PASSWORD is set to the default value 'changeme'
if [ "$HABBO_MYSQL_PASSWORD" = "changeme" ]; then
  echo "[level:ERROR][docker-habbo-server] Error: HABBO_MYSQL_PASSWORD is set to the default value 'changeme'. Please set a secure password."
  exit 1
fi

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
mysql.hostname = $HABBO_MYSQL_HOST
mysql.port = $HABBO_MYSQL_PORT
mysql.username = $HABBO_MYSQL_USERNAME
mysql.password = $HABBO_MYSQL_PASSWORD
mysql.database = $HABBO_MYSQL_DATABASE

[Logging]
log.received.packets = $HABBO_SERVER_LOG_RECEIVED_PACKETS
log.sent.packets = $HABBO_SERVER_LOG_SENT_PACKETS

[Console]
debug = $HABBO_SERVER_DEBUG
EOF

echo "[level:INFO][docker-habbo-web] Configuration file generated"