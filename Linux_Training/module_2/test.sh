#!/bin/bash

# Get PID of process using most memory
pid=$(ps aux --sort=-%mem | awk 'NR==2 {print $2}')


# - ps aux : lists all running processes
# - --sort=-%mem : sorts by memory usage (descending order)
# - awk 'NR==2 {print $2}' : takes the 2nd line (1st is header) and prints 2nd column (PID)

process_name=$(ps aux --sort=-%mem | awk 'NR==2 {print $11}')
mem_usage=$(ps aux --sort=-%mem | awk 'NR==2 {print $4}')



# Print process details
echo "Process with highest memory:"
echo "PID: $pid"
echo "Name: $process_name"
echo "Memory Usage: $mem_usage%"

# Terminate the process
echo "Terminating process..."
kill -15 $pid

# Killing or terminating the process

echo "Process terminated successfully"
