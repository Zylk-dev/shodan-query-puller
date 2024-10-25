#!/bin/bash

# Check if a query term was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <search_term>"
    exit 1
fi

SEARCH_TERM="$1"

echo "Repositories containing '$SEARCH_TERM' Shodan queries:"

# Search for repositories on GitHub containing the search term
RESULTS=$(curl -s "https://api.github.com/search/repositories?q=$SEARCH_TERM+in:description&per_page=100" | jq -r '.items[] | .full_name, .description')

# Check if any repositories were found
if [ -z "$RESULTS" ]; then
    echo "No repositories found."
    exit 0
fi

# Loop through the results and format the output
while IFS= read -r line; do
    echo "├── $line"
done <<< "$RESULTS"
