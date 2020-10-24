[![CircleCI](https://circleci.com/gh/irschad/project-ml-microservice-kubernetes.svg?style=svg)](https://app.circleci.com/pipelines/github/irschad)

## Project Overview

This project consists of a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project operationalizes a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

The project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. The following are the project tasks:
* Test the project code using linting
* Complete a Dockerfile to containerize this application
* Deploy the containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that the code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

---

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Docker & Kubernetes Steps

* Setup and Configure Docker locally:
  Install docker and complete the Dockerfile
  Run `make lint` and `hadolint Dockerfile`
* Create Flask app in Container: 
  Build the docker image, list docker images created and run the containerized Flask app by calling script: `./run_docker.sh`
  Make a prediction: Open a separate tab and call script: `./make_prediction.sh`
* Setup and Configure Kubernetes locally:
  Install kubectl and minikube
  Start minikube: `minikube start`
  Verify cluster:  `kubectl config view`
* Run via kubectl:
  Run the containerized application by calling script: `./run_kubernetes.sh`
  (Check pod status by executing `kubectl get pod` and rerun run_kubernetes.sh script when status changes from `ContainerCreating` to `Running`)
  Make a prediction: Open a separate tab and call script: `./make_prediction.sh`
* Delete the Kubernetes cluster: `minikube delete`  (Or pause by running `minikube stop`) 


### Description of the files used in this project
app.py - This is the Python flask app to serve out predictions about Boston Housing prices through API calls
/model_data - This has model data for Boston Housing Price Prediction
requirements.txt - This includes all the package names with versions to be installed
Makefile - This includes commands to set-up virtual environment, installing dependencies mentioned in requirement.txt and linting
Dockerfile - This includes commands to build the docker image
make_prediction.sh - This script sends request to the python flask App to get the Boston Housing Price Prediction
run_docker.sh - This includes commands to build a docker image, list the docker images, and run the container
upload_docker.sh : This includes commands to define dockerpath, authenticate and tag image and push the docker image to the docker path (in the docker hub)
run_kubernetes.sh : This includes commands to run the deployed docker image in a kubernetes cluster
/output_txt_files - Log of Output
/.circleci/config.yml - This is Circleci configuration (yaml) file for enabling Continous Integration pipeline
