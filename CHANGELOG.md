# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres
to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Non-root user (UID 1000) in Dockerfile for improved security
- OCI-compliant image labels with build args (BUILD_DATE, VERSION, VCS_REF)
- Environment variable references in docker-compose files
- Resource limits (memory) in docker-compose files
- `.env.example` template for environment configuration
- `scripts/lib/common.sh` with shared logging and validation functions
- `CONTRIBUTING.md` with contribution guidelines
- `.editorconfig` for consistent code style
- CI workflow with shellcheck, hadolint, yamllint, markdownlint

### Changed

- Shell scripts hardened with `set -euo pipefail` and proper variable quoting
- Makefile updated to support `docker-compose.override.yml` auto-detection
- `.gitignore` updated to exclude `.env` files and logs

### Removed

-

## [1.0.3] - 28 Jan 2025

### Added

- feature: generate server.ini dynamically at runtime using environment variables (#2)

### Changed

- Updated Dockerfile and startup scripts to support runtime configuration.

### Removed

-

## [1.0.0] - Havana Support - 30 Dec 2024

### Added

- feature: add havana support ([#1](https://github.com/habboservers/docker-habbo-server/pull/1))

### Changed

-

### Removed

-
