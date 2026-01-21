#!/bin/bash
set -euo pipefail

# Common functions for Havana scripts

# Logging helpers
log_info() {
  local component="${1:-docker-havana}"
  local message="${2}"
  echo "[level:INFO][${component}] ${message}"
}

log_warn() {
  local component="${1:-docker-havana}"
  local message="${2}"
  echo "[level:WARN][${component}] ${message}" >&2
}

log_error() {
  local component="${1:-docker-havana}"
  local message="${2}"
  echo "[level:ERROR][${component}] ${message}" >&2
}

log_debug() {
  local component="${1:-docker-havana}"
  local message="${2}"
  echo "[level:DEBUG][${component}] ${message}"
}

# Validate that required environment variables are set
# Usage: validate_required_vars "VAR1" "VAR2" "VAR3"
validate_required_vars() {
  local missing_vars=()

  for var in "$@"; do
    if [ -z "${!var:-}" ]; then
      missing_vars+=("$var")
    fi
  done

  if [ ${#missing_vars[@]} -ne 0 ]; then
    echo "[level:ERROR][docker-havana] Missing required environment variables: ${missing_vars[*]}" >&2
    return 1
  fi

  return 0
}

# Validate that a value is not empty
# Usage: validate_not_empty "value" "description"
validate_not_empty() {
  local value="${1:-}"
  local description="${2:-value}"

  if [ -z "$value" ]; then
    echo "[level:ERROR][docker-havana] ${description} cannot be empty" >&2
    return 1
  fi

  return 0
}

# Check if a file exists
# Usage: file_exists "/path/to/file"
file_exists() {
  local path="${1:-}"
  [ -f "$path" ]
}

# Check if a directory exists
# Usage: dir_exists "/path/to/dir"
dir_exists() {
  local path="${1:-}"
  [ -d "$path" ]
}

# Make a script executable if it isn't already
# Usage: ensure_executable "/path/to/script"
ensure_executable() {
  local script_path="${1:-}"

  if [ ! -x "$script_path" ]; then
    chmod +x "$script_path"
  fi
}

# Create backup of a directory
# Usage: create_backup "/path/to/dir" "backup_prefix" "component_name"
create_backup() {
  local source_dir="${1:-}"
  local backup_prefix="${2:-backup}"
  local component="${3:-docker-havana}"
  local backup_dir
  local timestamp

  backup_dir="$(dirname "$source_dir")/config_backups"
  timestamp=$(date +%Y%m%d_%H%M%S)

  if [ -d "$source_dir" ]; then
    mkdir -p "$backup_dir"
    if tar -czf "${backup_dir}/${backup_prefix}_${timestamp}.tar.gz" -C "$source_dir" .; then
      log_info "$component" "Configuration backup created at: ${backup_dir}/${backup_prefix}_${timestamp}.tar.gz"
      return 0
    else
      log_warn "$component" "Failed to create configuration backup"
      return 1
    fi
  fi

  return 0
}

# If script is run directly, show usage
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "This script is meant to be sourced by other scripts."
  echo "Usage: source \$(dirname \"\$0\")/lib/common.sh"
  exit 1
fi
