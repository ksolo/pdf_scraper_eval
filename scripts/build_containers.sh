#!/bin/bash

# Set the base directory to the scrapers directory
SCRAPERS_DIR="./scrapers"

# Iterate through each subdirectory in the scrapers directory
for scraper in "$SCRAPERS_DIR"/*; do
    if [ -d "$scraper" ]; then
        # Get the name of the scraper from the directory name
        scraper_name=$(basename "$scraper")

        # Convert the name to lowercase to use as the Docker tag
        lower_scraper_name=$(echo "$scraper_name" | tr '[:upper:]' '[:lower:]')

        # Build the Docker container, tag it with the name of the scraper
        echo "Building Docker container for $scraper_name"
        docker build -t "${lower_scraper_name}" -f "${scraper}/Dockerfile" "${PWD}"
    fi
done

echo "Docker build processes complete."
