#!/bin/bash

IMAGE_NAME="omega/flask-tutorial:v1"
CONTAINER_NAME="omega-flask"

echo "Checking Docker..."

if ! command -v docker &> /dev/null
then
    echo "Docker is not installed."
    exit 1
fi

echo "Stopping and removing old container..."
docker rm -f $CONTAINER_NAME 2>/dev/null

echo "Building Docker image..."
docker build -t $IMAGE_NAME .

echo "Starting container..."
docker run -d -p 5000:5000 --name $CONTAINER_NAME $IMAGE_NAME

echo "Initializing database..."
docker exec -it $CONTAINER_NAME flask --app flaskr init-db

CONTAINER_ID=$(docker ps -qf "name=$CONTAINER_NAME")

echo ""
echo "Deployment completed successfully!"
echo "-----------------------------------"
echo "Container Name : $CONTAINER_NAME"
echo "Container ID   : $CONTAINER_ID"
echo "Image Name     : $IMAGE_NAME"
echo "Application URL: http://localhost:5000"
