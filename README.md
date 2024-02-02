# Bash Logger

This script provides a set of logging functionalities for Bash scripts.  
It allows users to log messages with different severity levels, such as info, warning, error, and headers.   
These log messages are both printed to the console and saved to a log file with a unique timestamp.  

## Features

- **Colored Logging**: Each log level has a distinct color for easy identification.
- **Timestamps**: Every log message includes a timestamp for better tracking.
- **Log File Creation**: Automatically creates a log file in a 'logging' folder, located in the same directory as the user script.
- **Log Each execution**: For each execution is created unique he log file. Name includes the executed script name and a timestamp.
- **Error Handling**: Captures and logs exceptions that occur during the execution of the user script.

## Functions

- `setup_logging`: Initializes the logging environment. Creates a log directory and file.
- `log_info`: Logs an informational message.
- `log_warn`: Logs a warning message.
- `log_error`: Logs an error message.
- `log_header`: Logs a header message, highlighted for emphasis.

## Usage

1. Source the logger script in your Bash script.
2. Call `setup_logging` at the beginning of your script to initialize the logging.
3. Use `log_info`, `log_warn`, `log_error`, and `log_header` to log messages as required.

Example:
```bash
source /path/to/logger_script.sh
setup_logging
log_info "This is an info message."
log_warn "This is a warning message."
log_error "This is an error message."
log_header "This is a header message."
```

Output:  
![example_screen.png](example_screen.png)