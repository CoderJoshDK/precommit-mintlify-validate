#!/bin/bash


# Make sure mintlify is installed 
if ! command -v mintlify &> /dev/null; then
  >&2 echo "mintlify is not available on this system."
  >&2 echo "Please install it by running 'npm i -g mintlify'"
  exit 1
fi

ROOT_DIR="${1:-.}" 
cd "$ROOT_DIR"

output=$(mintlify broken-links)

# Check if the output contains any broken links
if [[ "$output" == *"No broken links found."* ]]; then
  echo "No broken links found."
else
  >&2 echo "$output"
  exit 1
fi

