#!/bin/bash

# Corey Knutson, 12/2/2021

docker container prune -f
docker image prune -f

# don't worry about this IF statement, it's for cross compiling images
if [ "$PUSH" = "1" ]; then
  docker build --tag rogueraptor7/kali:latest . 
  docker push rogueraptor7/kali:latest
fi

# this is the command that will build the Docker image. Use the dockerfile in the current directory
docker build -t rogueraptor7/kali:latest .
