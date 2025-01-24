#!/bin/bash

# Get input from the user
echo "Enter Build Version: "
read build_version
#build_version="11.1.4"

echo "Enter Build Number: "
read build_number
#build_number="588"

echo "Enter Branch: "
read branch
#branch="Development"

echo "Enter Note (max 20 words): "
read note
#note="Fixed QA Reported Issues"

# Function to extract unique issue keys from issue-keys.txt
function extract_issue_keys() {
  grep -oE 'HKI-[0-9]+' issue-keys.txt | sort | uniq
}

# Generate the release note
echo "-------------------------"
echo ""
echo "📣 Developer Release Note"
echo ""
echo "App - Helakuru Super iOS"
echo "Version - $build_version($build_number)"
echo "Branch - $branch"
echo ""
echo "Download Reference :"
echo "TestFlight Helakuru iOS -"
echo "$build_version($build_number)"
echo ""
echo "Note :"
echo "$note"
echo ""
# Check if any issue keys exist
issue_keys=$(extract_issue_keys)
if [ -n "$issue_keys" ]; then
    echo "Fixed Issues :"
    # Calculate the number of keys per column
    num_keys=$(echo "$issue_keys" | wc -l)
    keys_per_column=$(($num_keys / 3))
    # Initialize counters
    count=0
    column=1

    # Loop through each key and print in 3 columns
    while IFS= read -r key; do
        if [ $(($count % 4)) -eq 3 ]; then
            count=0
            column=1
            echo ""
        fi
        if [ $column -eq 3 ]; then
            printf "%-0s\n" "$key"
        else
            printf "%-10s" "$key"
        fi
        count=$((count + 1))
        column=$((column + 1))
    done <<< "$issue_keys"


fi