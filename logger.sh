#!/bin/bash

LOG_DIR=""
LOG_FILE=""

# Colors
GREEN="\e[0;32"
ORANGE="\e[0;33"
RED="\e[0;31"
BLUE="\e[0;34m"
BOLD_BLUE="\e[1;34"
NC="\e[0m"

setup_logging() {
    local script_name=$(basename "$0")
    local script_dir=$(dirname "$0")
    local timestamp=$(date +"%Y_%m_%d__%H_%M_%S")
    LOG_DIR="${script_dir}/logging"

    mkdir -p "${LOG_DIR}" || return 1
    LOG_FILE="${LOG_DIR}/${script_name}_${timestamp}.log"
}

log_message() {
    local level="$1"
    local color="$2"
    local msg="$3"
    local tag="$4"
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Log to console with color
    if [[ "$tag" == "TAG" ]]; then
        printf "${color}m${timestamp} [${level}]${NC} ${BLUE}${msg}${NC}\n"
    else
        printf "${color}m${timestamp} [${level}]${NC} ${msg}\n"
    fi


    # Log to file without color
    printf "${timestamp} [${level}] ${msg}\n" >> "${LOG_FILE}"
}

log_info() {
    log_message "INF" "$GREEN" "$1"
}

log_warn() {
    log_message "WRN" "$ORANGE" "$1"
}

log_error() {
    log_message "ERR" "$RED" "$1"
}

log_header() {
    log_message "TAG" "$BOLD_BLUE" "$1" "TAG"
}
