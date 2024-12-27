#!/bin/bash

# Set default values for environment variables if they are not already set
HABBO_WEBSERVER_SITE_DIRECTORY=${HABBO_WEBSERVER_SITE_DIRECTORY:-tools/www}
HABBO_WEBSERVER_IP_BIND=${HABBO_WEBSERVER_IP_BIND:-127.0.0.1}
HABBO_WEBSERVER_PORT=${HABBO_WEBSERVER_PORT:-80}
HABBO_SERVER_RCON_IP_BIND=${HABBO_SERVER_RCON_IP_BIND:-127.0.0.1}
HABBO_SERVER_RCON_PORT=${HABBO_SERVER_RCON_PORT:-12309}
HABBO_MYSQL_HOST=${HABBO_MYSQL_HOST:-127.0.0.1}
HABBO_MYSQL_PORT=${HABBO_MYSQL_PORT:-3306}
HABBO_MYSQL_USERNAME=${HABBO_MYSQL_USERNAME:-havana}
HABBO_MYSQL_PASSWORD=${HABBO_MYSQL_PASSWORD:-changeme} # Default value
HABBO_MYSQL_DATABASE=${HABBO_MYSQL_DATABASE:-havana}
HABBO_WEBSERVER_TEMPLATE_DIRECTORY=${HABBO_WEBSERVER_TEMPLATE_DIRECTORY:-tools/www-tpl}
HABBO_WEBSERVER_TEMPLATE_NAME=${HABBO_WEBSERVER_TEMPLATE_NAME:-default-en}
HABBO_WEBSERVER_PAGE_ENCODING=${HABBO_WEBSERVER_PAGE_ENCODING:-utf-8}

# Fail if HABBO_MYSQL_PASSWORD is set to the default value 'changeme'
if [ "$HABBO_MYSQL_PASSWORD" = "changeme" ]; then
  echo "[level:ERROR][docker-habbo-web] Error: HABBO_MYSQL_PASSWORD is set to the default value 'changeme'. Please set a secure password."
  exit 1
fi

# Generate the .ini file directly
cat <<EOF > /data/webserver-config.ini
[Site]
site.directory = $HABBO_WEBSERVER_SITE_DIRECTORY

[Global]
bind.ip = $HABBO_WEBSERVER_IP_BIND
bind.port = $HABBO_WEBSERVER_PORT

[Rcon]
rcon.ip = $HABBO_SERVER_RCON_IP_BIND
rcon.port = $HABBO_SERVER_RCON_PORT

[Database]
mysql.hostname = $HABBO_MYSQL_HOST
mysql.port = $HABBO_MYSQL_PORT
mysql.username = $HABBO_MYSQL_USERNAME
mysql.password = $HABBO_MYSQL_PASSWORD
mysql.database = $HABBO_MYSQL_DATABASE

[Template]
template.directory = $HABBO_WEBSERVER_TEMPLATE_DIRECTORY
template.name = $HABBO_WEBSERVER_TEMPLATE_NAME

page.encoding = $HABBO_WEBSERVER_PAGE_ENCODING
EOF

echo "[level:INFO][docker-habbo-web] Configuration file generated"