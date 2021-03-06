#!/usr/bin/env bash

# This is to run Docker Hub container with Kubernetes

# Step 1:
# This is your Docker ID/path
dockerpath=irschad/mlpredict

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run mlpredict --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward mlpredict 8080:80
