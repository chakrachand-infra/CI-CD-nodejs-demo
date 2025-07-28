#!/bin/bash

echo "Simulating deployment..."
CONTAINER_ID=$(docker ps -q --filter "ancestor=your-dockerhub-username/ci-cd-nodejs-demo:latest")

if [ -n "$CONTAINER_ID" ]; then
  echo "Stopping old container..."
  docker stop "$CONTAINER_ID"
  docker rm "$CONTAINER_ID"
fi

echo "Running new container..."
docker run -d -p 3000:3000 your-dockerhub-username/ci-cd-nodejs-demo:latest

echo "Deployment completed!"
