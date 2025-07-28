#!/bin/bash

echo "Simulating deployment..."
CONTAINER_ID=$(docker ps -q --filter "ancestor=chakribaggam123/demo")

if [ -n "$CONTAINER_ID" ]; then
  echo "Stopping old container..."
  docker stop "$CONTAINER_ID"
  docker rm "$CONTAINER_ID"
fi

echo "Running new container..."
docker run -d -p 3000:3000 chakribaggam123/demo:v23

echo "Deployment completed!"
