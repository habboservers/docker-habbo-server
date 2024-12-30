#!/bin/bash

# Run havana-setupWebServer.sh
echo "[level:INFO][docker-habbo-web] Running web Server setup..."
if ./havana-setupWebServer.sh; then
    echo "[level:INFO][docker-habbo-web] Web Server setup executed successfully."
else
    echo "[level:ERROR][docker-habbo-web] ERROR: Web Server setup failed!" >&2
    exit 1
fi

# Run havana-setupServer.sh
echo "[level:INFO][docker-habbo-server] Running Server setup..."
if ./havana-setupServer.sh; then
    echo "[level:INFO][docker-habbo-server] Server setup executed successfully."
else
    echo "[level:ERROR][docker-habbo-server] ERROR: Server setup failed!" >&2
    exit 1
fi
