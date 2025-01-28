#!/bin/bash

# Set default values for environment variables if they are not already set
: "${HABBO_WEBSERVER_SITE_DIRECTORY:=tools/www}"
: "${HABBO_WEBSERVER_IP_BIND:=127.0.0.1}"
: "${HABBO_WEBSERVER_PORT:=80}"
: "${HABBO_SERVER_RCON_IP_BIND:=127.0.0.1}"
: "${HABBO_SERVER_RCON_PORT:=12309}"
: "${HABBO_DATABASE_HOST:=127.0.0.1}"
: "${HABBO_DATABASE_PORT:=3306}"
: "${HABBO_DATABASE_USERNAME:=havana}"
: "${HABBO_DATABASE_PASSWORD:=changeme}" # Default value
: "${HABBO_DATABASE_NAME:=havana}"
: "${HABBO_WEBSERVER_TEMPLATE_DIRECTORY:=tools/www-tpl}"
: "${HABBO_WEBSERVER_TEMPLATE_NAME:=default-en}"
: "${HABBO_WEBSERVER_PAGE_ENCODING:=utf-8}"

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
mysql.hostname = $HABBO_DATABASE_HOST
mysql.port = $HABBO_DATABASE_PORT
mysql.username = $HABBO_DATABASE_USERNAME
mysql.password = $HABBO_DATABASE_PASSWORD
mysql.database = $HABBO_DATABASE_NAME

[Template]
template.directory = $HABBO_WEBSERVER_TEMPLATE_DIRECTORY
template.name = $HABBO_WEBSERVER_TEMPLATE_NAME

page.encoding = $HABBO_WEBSERVER_PAGE_ENCODING
EOF

echo "[level:INFO][docker-habbo-web] Configuration file generated"