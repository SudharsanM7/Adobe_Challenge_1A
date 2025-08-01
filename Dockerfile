FROM --platform=linux/amd64 python:3.10-slim

WORKDIR /app

# Copy the processing script
COPY process_pdfs.py .

# Install dependencies
RUN pip install --no-cache-dir PyMuPDF==1.23.14

# Run the script
CMD ["python", "process_pdfs.py"]
