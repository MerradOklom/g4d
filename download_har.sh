#!/bin/bash

# Ensure HAR_URL and COOKIES_URL are set
if [ -z "$HAR_URL" ]; then
    echo "Error: HAR_URL environment variable is not set."
    exit 1
fi

if [ -z "$COOKIES_URL" ]; then
    echo "Error: COOKIES_URL environment variable is not set."
    exit 1
fi

# Extract the file names from the URLs
HAR_FILE_NAME=$(basename "$HAR_URL")
COOKIES_FILE_NAME=$(basename "$COOKIES_URL")

# Download the HAR file
echo "Downloading HAR file from $HAR_URL..."
wget -qO "/app/har_and_cookies/$HAR_FILE_NAME" "$HAR_URL" || {
    echo "Error: Failed to download the HAR file."
    exit 1
}

# Download the cookies.json file
echo "Downloading cookies.json file from $COOKIES_URL..."
wget -qO "/app/har_and_cookies/$COOKIES_FILE_NAME" "$COOKIES_URL" || {
    echo "Error: Failed to download the cookies.json file."
    exit 1
}

echo "Files downloaded successfully:"
echo "HAR file: /app/har_and_cookies/$HAR_FILE_NAME"
echo "Cookies file: /app/har_and_cookies/$COOKIES_FILE_NAME"

# Execute the main application command
exec "$@"
