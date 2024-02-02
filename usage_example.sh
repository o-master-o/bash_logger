#!/bin/bash
SCRIPT_DIR=$(realpath $(dirname "$0"))
LOGGER="$SCRIPT_DIR/logger.sh"

source "$LOGGER"

setup_logging
log_info "This is an info message."
log_warn "This is a warning message."
log_error "This is an error message."
log_header "This is a header message."