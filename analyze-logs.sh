#!/bin/bash

set -euo pipefail  # Stop script on errors, undefined variables, or pipe failures

log_file=$1  # Log file path passed as the first argument

# Function to show top 5 entries
# $1 = description
# $2 = column number (for awk)
# $3 = field separator (optional, default: space)
show_top5() {
    local description=$1
    local column=$2
    local sep=${3:-" "}  # default separator is space

    echo "$description"
    awk -F"$sep" "{print \$$column}" "$log_file" | sort | uniq -c | sort -nr | head -5 | while read count value; do
        echo "$value - $count requests"
    done
    echo
}

# Top 5 IP addresses
show_top5 "Top 5 IP addresses with the most requests:" 1

# Top 5 requested paths
show_top5 "Top 5 most requested paths:" 7

# Top 5 response status codes
show_top5 "Top 5 response status codes:" 9

# Top 5 user agents (split by " as separator)
show_top5 "Top 5 user agents:" 6 '"'