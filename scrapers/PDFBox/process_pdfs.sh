#!/bin/bash

# Directory where output files will be stored
OUTPUT_DIR="/output/PDFBox"

# Create output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Iterate over all PDF files in the /app directory
for pdf_file in /app/samples/*.pdf; do
    # Extract the filename without extension
    filename=$(basename -- "$pdf_file")
    filename="${filename%.*}"

    # Run PDFBox to convert PDF to text
    java -jar /app/pdfbox.jar export:text -i="$pdf_file" -o="${OUTPUT_DIR}/${filename}.txt"
done
