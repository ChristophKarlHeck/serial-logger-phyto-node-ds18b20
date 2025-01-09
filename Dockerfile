# Use Python 3.11.2 as the base image
FROM python:3.11.2-slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Make the script executable
RUN chmod +x /app/serial_temp.py

# Set the default entrypoint to the script
ENTRYPOINT ["python3", "/app/serial_temp.py"]