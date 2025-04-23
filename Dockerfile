# Use official Python image
FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y gcc g++ gnupg2 curl unixodbc-dev libsasl2-dev build-essential libssl-dev libffi-dev && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Set environment variables (optional, use .env in Render or manually set vars)
ENV PYTHONUNBUFFERED=1

# Expose port
EXPOSE 8000

# Start the app using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
