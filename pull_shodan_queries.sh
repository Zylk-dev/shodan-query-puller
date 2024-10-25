#!/bin/bash

# Check for the search term as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <search_term>"
    exit 1
fi

SEARCH_TERM="$1"
GITHUB_API_URL="https://api.github.com/search/repositories"
QUERY="shodan+$SEARCH_TERM"

# Fetch repositories containing the Shodan queries
response=$(curl -s "${GITHUB_API_URL}?q=${QUERY}")

# Check if the response contains any items
if echo "$response" | grep -q '"total_count": 0'; then
    echo "No repositories found containing the search term '${SEARCH_TERM}'."
    exit 0
fi

# Debugging: Print the raw response for analysis
# echo "Debug: Raw response from GitHub API:"
# echo "$response"

# Check if the response is valid JSON
if ! echo "$response" | jq empty; then
    echo "Error: Failed to parse the GitHub API response. It may be malformed."
    exit 1
fi

# Print a header
echo -e "\nRepositories containing '${SEARCH_TERM}' Shodan queries:\n"

# Extract repository names and descriptions
echo "$response" | jq -r '.items[] | "\(.full_name)\nDescription: \(.description // "No description available")\nURL: \(.html_url)\n"' | while IFS= read -r line; do
    # Print repository details in a clean format
    if [[ $line =~ ^http ]]; then
        echo -e "Link: $line\n"
    else
        echo -e "$line\n"
    fi
done
