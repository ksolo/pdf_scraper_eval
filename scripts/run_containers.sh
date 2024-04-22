#!/bin/bash

# Set the base directory to the scrapers directory
SCRAPERS_DIR="./scrapers"

# clean the output directory
rm -rf "./output/*"

# Iterate through each subdirectory in the scrapers directory
for scraper in "$SCRAPERS_DIR"/*; do
    if [ -d "$scraper" ]; then
        # Get the name of the scraper from the directory name
        scraper_name=$(basename "$scraper")

        # Convert the name to lowercase for the Docker container name
        lower_scraper_name=$(echo "$scraper_name" | tr '[:upper:]' '[:lower:]')

        # Run the Docker container, appending '-container' to the name
        echo "Running Docker container for $scraper_name"
        docker run --rm -v "${PWD}/output:/output" "${lower_scraper_name}"
    fi
done

echo "Run complete"
