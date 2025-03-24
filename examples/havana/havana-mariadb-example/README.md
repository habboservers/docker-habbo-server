# Docker Habbo Server Setup Guide

![Habbo Server Banner](banner.gif)

This guide will help you set up and run your own Habbo server using Docker containers.

## Prerequisites

### 1. Install Docker and Docker Compose

#### For Windows:
1. Download and install [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop)
2. During installation, ensure WSL 2 is enabled if prompted
3. Start Docker Desktop after installation

#### For macOS:
1. Download and install [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop)
2. Start Docker Desktop after installation

#### For Linux (Ubuntu/Debian):
```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Install Docker Compose
sudo apt-get update
sudo apt-get install docker-compose-plugin

# Add your user to docker group (optional, to run docker without sudo)
sudo usermod -aG docker $USER
```

### 2. Verify Installation
Open a terminal/command prompt and run:
```bash
docker --version
docker compose version
```

## Setting Up Your Habbo Server

### 1. Create Project Directory
```bash
mkdir my-habbo-server
cd my-habbo-server
```

### 2. Create Docker Compose File
Copy the example `docker-compose.yml` from our [examples/havana/havana-mariadb-example](../examples/havana/havana-mariadb-example/docker-compose.yml) directory to your project folder. This file contains all the necessary configurations for both the database and Habbo server.

```bash
# Create the docker-compose.yml file in your project directory
curl -o docker-compose.yml https://raw.githubusercontent.com/habboservers/docker-habbo/main/examples/havana/havana-mariadb-example/docker-compose.yml
```

### 3. Start the Services
```bash
docker compose up -d
```

## Configuration Options

### Environment Variables

The Habbo server container supports the following environment variables:

| Variable | Description | Default |
|----------|-------------|---------|
| HABBO_DATABASE_HOST | Database host | habbo-database |
| HABBO_DATABASE_PORT | Database port | 3306 |
| HABBO_DATABASE_USERNAME | Database username | havana |
| HABBO_DATABASE_PASSWORD | Database password | havana |
| HABBO_DATABASE_NAME | Database name | havana |
| HABBO_WEBSERVER_STATIC_CONTENT_PATH | Path to static content | https://cdn.habboservers.com/havana |

## Accessing Your Server

After starting the services, you can access your server via: http://localhost or http://127.0.0.1.

## Troubleshooting

### Common Issues

1. **Database Connection Failed**
   - Verify database credentials in docker-compose.yml
   - Ensure database container is healthy: `docker compose ps`
   - Check database logs: `docker compose logs habbo-database`

2. **Web Server Not Responding**
   - Verify port 80 is not in use by another service
   - Check web server logs: `docker compose logs habbo-server`

3. **Game Server Connection Issues**
   - Verify port 12321 is not blocked by firewall
   - Check game server logs: `docker compose logs habbo-server`

### Getting Help

If you encounter any issues:

1. Check the container logs for error messages
2. Verify all environment variables are set correctly
3. Ensure all required ports are available and not blocked
4. Visit our [GitHub repository](https://github.com/habboservers/docker-habbo) for more information

## Maintenance

### Updating the Server
```bash
# Pull latest images
docker compose pull

# Restart services with new images
docker compose up -d
```

### Backup
```bash
# Backup database
docker compose exec -T habbo-database mysqldump -u havana -phavana havana > backup.sql
``` 