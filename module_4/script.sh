#!/bin/bash

# Define file paths
INPUT_FILE="/home/kavin/embedUR/module_4/input.txt"
OUTPUT_FILE="output.txt"

# Create output file if it doesn't exist, otherwise clear its contents
if [ ! -f "$OUTPUT_FILE" ]; then
    touch "$OUTPUT_FILE"
else
    > "$OUTPUT_FILE"
fi

# Define parameters to search for
params=("frame.time" "wlan.fc.type" "wlan.fc.subtype")

# Initialize line counter
line_number=0

# Record start time
start_time=$(date +%s.%N)

# Process each line
while read -r line; do
    ((line_number++))
    
    # Only process lines containing a quote (potential parameter lines)
    if [[ $line == *"\""* ]]; then
        for param in "${params[@]}"; do
            # Using bash string comparison instead of grep
            if [[ $line == *"\"$param\""* ]]; then
                # Using parameter expansion instead of sed/cut
                value=${line#*: }
                echo "Line $line_number: Found $param"
                echo "\"$param\": $value" >> "$OUTPUT_FILE"
                break  # Exit loop once parameter is found
            fi
        done
    fi
done < "$INPUT_FILE"

# Calculate and display execution time
end_time=$(date +%s.%N)
execution_time=$(echo "$end_time - $start_time" | bc)
echo "Processed $line_number lines in $execution_time seconds"