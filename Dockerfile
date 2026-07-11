FROM python:3.13-slim

WORKDIR /app
COPY . /app

# Combine apt updates, installs, and pip install into one layer
# to optimize build time and reduce image size.
RUN apt-get update -y && \
    apt-get install -y awscli ffmpeg libsm6 libxext6 unzip && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["python3", "app.py"]