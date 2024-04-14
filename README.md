# PDF Scraper Evaluation

## Project Overview
This project aims to provide a uniform way to run various PDF scrapers, each encapsulated within its Docker container,
against a set of known PDF files located in the `samples` directory. The goal is to compare the performance and
effectiveness of different PDF scraping tools by processing the same set of documents through each scraper.

## Goals
- **Uniformity**: Utilize Docker to ensure that each PDF scraper operates under the same system conditions.
- **Comparability**: Process the same set of PDFs with different scrapers to compare results.
- **Automation**: Simplify the process of building and running scrapers through automation scripts.

## Prerequisites
- **Docker**: Docker must be installed on your machine. Installation guides for Docker can be found [here](https://docs.docker.com/get-docker/).
- **Operating System**: The scripts are designed to run on Unix-like operating systems, including Linux distributions and macOS.

## Usage Instructions

### Building Docker Containers

This will build each of the scraper containers as defined in the `scrapers` directory

```sh
$ scripts/build_containers.sh
```

### Running the Containers

This will execute each of the containers. It mounts the `output` directory to the container as a
means of exporting the resulting files to the host machine. Later this will optionally export the
results to an S3 buckets.

```sh
$ scripts/run_containers.sh
```

You may need to update the permissions of the files in the `scripts` directory to be executable.

## Contributing
Contributions to the project are welcome. Please ensure that any additional scrapers are Dockerized and
include appropriate scripts for processing PDF files. An example can be found in the `scrapers/PDFBox` directory
