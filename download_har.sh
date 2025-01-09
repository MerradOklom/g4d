#!/bin/bash

# Ensure the HAR URL is provided
if [ -z "$HAR_URL" ]; then
  echo "Error: HAR_URL environment variable is not set."
  exit 1
fi

# Download the HAR file
echo "Downloading HAR file from $HAR_URL..."
wget -O /app/har_and_cookies/har_file.har "$HAR_URL"

if [ $? -ne 0 ]; then
  echo "Error: Failed to download the HAR file."
  exit 1
fi

echo "HAR file downloaded successfully to /app/har_and_cookies/har_file.har"

# Execute the main application command
exec "$@"
