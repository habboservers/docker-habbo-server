.PHONY: help build build-no-cache up down logs shell restart fresh \
        lint validate version version-bump-patch version-bump-minor version-bump-major \
        clean prune

# Variables
IMAGE_NAME := docker-habbo-server
CONTAINER_NAME := habbo-server
VERSION_FILE := VERSION

# Default target
.DEFAULT_GOAL := help

##@ Docker Operations

build: ## Build Docker image locally
	docker build -t $(IMAGE_NAME):latest .

build-no-cache: ## Build Docker image without cache
	docker build --no-cache -t $(IMAGE_NAME):latest .

up: ## Start containers (docker-compose up -d)
	docker compose up -d

down: ## Stop containers
	docker compose down

logs: ## Tail container logs
	docker compose logs -f

shell: ## Shell into running container
	docker exec -it $(CONTAINER_NAME) /bin/bash

restart: ## Restart containers
	docker compose restart

fresh: ## Remove volumes and start fresh (runs DB init scripts)
	docker compose down -v
	docker compose up -d

##@ Development

lint: ## Lint shell scripts (requires shellcheck)
	@command -v shellcheck >/dev/null 2>&1 || { echo "shellcheck not installed. Install with: brew install shellcheck"; exit 1; }
	shellcheck scripts/havana-*

validate: ## Run validation checks
	@echo "Validating Dockerfile..."
	@docker build --check . 2>/dev/null || echo "Note: --check requires Docker BuildKit"
	@echo "Validating docker-compose.yml..."
	docker compose config --quiet
	@echo "Validation complete."

##@ Versioning

version: ## Display current version
	@cat $(VERSION_FILE)

version-bump-patch: ## Bump patch version (x.y.Z)
	@current=$$(cat $(VERSION_FILE)); \
	major=$$(echo $$current | cut -d. -f1); \
	minor=$$(echo $$current | cut -d. -f2); \
	patch=$$(echo $$current | cut -d. -f3); \
	new_patch=$$((patch + 1)); \
	new_version="$$major.$$minor.$$new_patch"; \
	echo "$$new_version" > $(VERSION_FILE); \
	echo "Version bumped: $$current -> $$new_version"

version-bump-minor: ## Bump minor version (x.Y.0)
	@current=$$(cat $(VERSION_FILE)); \
	major=$$(echo $$current | cut -d. -f1); \
	minor=$$(echo $$current | cut -d. -f2); \
	new_minor=$$((minor + 1)); \
	new_version="$$major.$$new_minor.0"; \
	echo "$$new_version" > $(VERSION_FILE); \
	echo "Version bumped: $$current -> $$new_version"

version-bump-major: ## Bump major version (X.0.0)
	@current=$$(cat $(VERSION_FILE)); \
	major=$$(echo $$current | cut -d. -f1); \
	new_major=$$((major + 1)); \
	new_version="$$new_major.0.0"; \
	echo "$$new_version" > $(VERSION_FILE); \
	echo "Version bumped: $$current -> $$new_version"

##@ Cleanup

clean: ## Remove stopped containers and dangling images
	docker compose down --remove-orphans
	docker image prune -f

prune: ## Docker system prune (removes all unused data)
	docker system prune -f

##@ Help

help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
