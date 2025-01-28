#!/bin/bash

# Generate the configuration files
./havana-setup.sh

# Run run_web.sh and run_server.sh in parallel
echo "[level:INFO][docker-habbo-web] Starting Web Server"
./run_web.sh & # Run web server in the background
WEB_PID=$!

echo "[level:INFO][docker-habbo-server] Starting Server"
./run_server.sh & # Run server in the background
SERVER_PID=$!

# Wait for both processes to keep the container running
wait $WEB_PID $SERVER_PID