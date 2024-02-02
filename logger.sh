#!/bin/bash

# Logger script for sourcing in user scripts

# Global variables
LOG_DIR=""
LOG_FILE=""

# Function to setup logging
setup_logging() {
    local script_name script_dir timestamp

    script_name=$(basename "$0")
    script_dir=$(dirname "$0")
    timestamp=$(date +"%Y_%m_%d__%H_%M_%S")
    LOG_DIR="${script_dir}/logging"

    mkdir -p "${LOG_DIR}" || return 1
    LOG_FILE="${LOG_DIR}/${script_name}_${timestamp}.log"
}

# Function to log messages
log_message() {
    local level color msg timestamp

    level="$1"
    color="$2"
    msg="$3"
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Log to console with color
    printf "\e[${color}m%s [%s]\e[0m %s\n" "${timestamp}" "${level}" "${msg}"

    # Log to file without color
    printf "%s [%s] %s\n" "${timestamp}" "${level}" "${msg}" >> "${LOG_FILE}"
}

# Wrapper functions for different log levels
log_info() {
    log_message "INFO" "0;32" "$1"
}

log_warn() {
    log_message "WARN" "0;33" "$1"
}

log_error() {
    log_message "ERROR" "0;31" "$1"
}

log_header() {
    log_message "HEADER" "1;34" "$1"
}

# Example usage
# setup_logging
# log_info "This is an info message."
# log_warn "This is a warning message."
# log_error "This is an error message."
# log_header "This is a header message."
