# Use Amazon Corretto as the base image
FROM amazoncorretto:latest

# Install wget using yum
RUN yum update -y && \
    yum install -y wget && \
    yum clean all && \
    rm -rf /var/cache/yum

# Create a directory to hold the application
WORKDIR /app

# Install PDFBox
RUN wget https://archive.apache.org/dist/pdfbox/3.0.2/pdfbox-app-3.0.2.jar -O pdfbox.jar

# Copy the samples directory contents into the container at /app
COPY ./samples /app/samples

# Copy command script into the container at /app/scripts
COPY ./scrapers/PDFBox/process_pdfs.sh /app/scripts/

# Change the permissions of the scripts file
RUN chmod +x /app/scripts/process_pdfs.sh

# Set the script as the entrypoint
ENTRYPOINT ["/app/scripts/process_pdfs.sh"]
