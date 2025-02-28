#!/bin/bash

# Error log file
ERROR_LOG="errors.log"

# Function to log errors
log_error() {
    local error_msg="$1"
    echo "ERROR: $error_msg" | tee -a "$ERROR_LOG" >&2
}

# Function to display help menu using here document
show_help() {
    cat << EOF
File Analyzer - Search for keywords in files

Usage:
    $0 -d <directory> -k <keyword>    Search for keyword in directory
    $0 -f <file> -k <keyword>        Search for keyword in specific file
    $0 --help                        Display this help menu

Options:
    -d <directory>    Directory to search recursively
    -k <keyword>      Keyword to search for
    -f <file>        Specific file to search
    --help           Show this help message
EOF
}

# Debug function to demonstrate $@ usage
debug_args() {
    echo "Script name: $0"
    echo "Number of arguments: $#"
    echo "All arguments received: $@"
    echo "Exit status of last command: $?"
}

# Recursive function to search files
search_files() {
    local dir="$1"
    local keyword="$2"
    
    # Check if directory exists
    if [[ ! -d "$dir" ]]; then
        log_error "Directory '$dir' not found"
        return 1
    fi
    
    # Search recursively
    for item in "$dir"/*; do
        if [[ -d "$item" ]]; then
            search_files "$item" "$keyword"
        elif [[ -f "$item" ]]; then
            if grep -l "$keyword" "$item" &> /dev/null; then
                echo "Found keyword in: $item"
            fi
        fi
    done
}

# Function to search in specific file using here string
search_file() {
    local file="$1"
    local keyword="$2"
    
    if [[ ! -f "$file" ]]; then
        log_error "File '$file' not found"
        return 1
    fi
    
    if grep -q "$keyword" <<< "$(cat "$file")"; then
        echo "Found keyword in: $file"
    else
        echo "Keyword not found in: $file"
    fi
}

# Validate keyword using regex
validate_keyword() {
    local keyword="$1"
    if [[ ! "$keyword" =~ ^[a-zA-Z0-9_.-]+$ ]]; then
        log_error "Invalid keyword format"
        return 1
    fi
    return 0
}

# Main script

# Debug mode to show all arguments
if [[ "$1" == "--debug" ]]; then
    debug_args "$@"
    exit 0
fi

if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Initialize variables
directory=""
keyword=""
file=""

# Parse command line arguments
while getopts ":d:k:f:" opt; do
    case $opt in
        d) directory="$OPTARG" ;;
        k) keyword="$OPTARG" ;;
        f) file="$OPTARG" ;;
        \?) log_error "Invalid option: -$OPTARG"; exit 1 ;;
        :) log_error "Option -$OPTARG requires an argument"; exit 1 ;;
    esac
done

# Validate inputs
if [[ -z "$keyword" ]]; then
    log_error "Keyword is required"
    exit 1
fi

# Validate keyword format
if ! validate_keyword "$keyword"; then
    exit 1
fi

# Execute based on provided arguments
if [[ -n "$file" ]]; then
    search_file "$file" "$keyword"
elif [[ -n "$directory" ]]; then
    search_files "$directory" "$keyword"
else
    log_error "Either directory (-d) or file (-f) is required"
    show_help
    exit 1
fi

exit $?