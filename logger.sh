#!/bin/bash

LOG_DIR=""
LOG_FILE=""

setup_logging() {
    local script_name script_dir timestamp

    script_name=$(basename "$0")
    script_dir=$(dirname "$0")
    timestamp=$(date +"%Y_%m_%d__%H_%M_%S")
    LOG_DIR="${script_dir}/logging"

    mkdir -p "${LOG_DIR}" || return 1
    LOG_FILE="${LOG_DIR}/${script_name}_${timestamp}.log"

    exec 3>&1 4>&2
    trap 'exec 2>&4 1>&3' 0 1 2 3
    exec 1>>"${LOG_FILE}" 2>&1
}

log_info() {
    local msg timestamp
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    msg="$1"
    printf "\e[0;32m%s [INF]\e[0m %s\n" "${timestamp}" "${msg}" | tee /dev/fd/3
}

log_warn() {
    local msg timestamp
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    msg="$1"
    printf "\e[0;33m%s [WRN]\e[0m %s\n" "${timestamp}" "${msg}" | tee /dev/fd/3
}

log_error() {
    local msg timestamp
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    msg="$1"
    printf "\e[0;31m%s [ERR]\e[0m %s\n" "${timestamp}" "${msg}" | tee /dev/fd/3 >&2
}

log_header() {
    local msg timestamp
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    msg="$1"
    printf "\e[1;34m%s [HEADER]\e[0m %s\n" "${timestamp}" "${msg}" | tee /dev/fd/3
}

