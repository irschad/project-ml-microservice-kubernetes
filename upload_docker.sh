#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=irschad/mlpredict

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username irschad
docker tag mlpredict $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath

