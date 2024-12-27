#!/bin/bash

# Run havana-webServerSetup.sh
echo "[level:INFO][docker-habbo-web] Running web Server setup..."
if ./havana-webServerSetup.sh; then
    echo "[level:INFO][docker-habbo-web] Web Server setup executed successfully."
else
    echo "[level:ERROR][docker-habbo-web] ERROR: Web Server setup failed!" >&2
    exit 1
fi

# Run havana-serverSetup.sh
echo "[level:INFO][docker-habbo-server] Running Server setup..."
if ./havana-serverSetup.sh; then
    echo "[level:INFO][docker-habbo-server] Server setup executed successfully."
else
    echo "[level:ERROR][docker-habbo-server] ERROR: Server setup failed!" >&2
    exit 1
fi

# Run run_web.sh and run_server.sh in parallel
echo "[level:INFO][docker-habbo-web] Starting Web Server"
./run_web.sh & # Run web server in the background
WEB_PID=$!

echo "[level:INFO][docker-habbo-server] Starting Server"
./run_server.sh & # Run server in the background
SERVER_PID=$!

# Wait for both processes to keep the container running
wait $WEB_PID $SERVER_PID