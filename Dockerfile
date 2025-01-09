# Use the base image
FROM hlohaus789/g4f:latest

# Set the working directory
WORKDIR /app

# Install necessary tools
RUN apt-get update && apt-get install -y wget && apt-get clean

# Create the folder for HAR and cookies
RUN mkdir -p /app/har_and_cookies

# Set the environment variable for the HAR URL (default to an empty string)
ENV HAR_URL=""

# Add a script to download the HAR file during container startup
COPY download_har.sh /app/download_har.sh
RUN chmod +x /app/download_har.sh

# Expose the port used by the API
EXPOSE 8080

# Set the entrypoint script
ENTRYPOINT ["/app/download_har.sh"]
CMD ["python", "-m", "g4f.cli", "api", "--port", "8080", "--debug"]
