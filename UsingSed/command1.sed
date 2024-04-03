# Replace multiple spaces with a single space
s/  */ /g

# Remove trailing whitespace at the end of lines
s/[[:space:]]*$//

# Add spaces around binary operators
s/\([^[:alnum:][:space:]]\)\([+*\/=-]\)\([^[:alnum:][:space:]]\)/\1 \2 \3/g
