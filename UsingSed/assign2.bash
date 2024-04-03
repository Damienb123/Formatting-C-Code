#!/bin/bash

# Check if the input file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Define temporary file names
temp_file1=$(mktemp)
temp_file2=$(mktemp)

# Perform formatting using sed scripts
sed -f command1.sed "$input_file" > "$temp_file1"
sed -f command2.sed "$temp_file1" > "$temp_file2"

# Output the result to stdout
cat "$temp_file2"

# Clean up temporary files
rm "$temp_file1" "$temp_file2"

