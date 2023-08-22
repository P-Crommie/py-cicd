# py-cicd: DevOps CI/CD Project with GitLab CI

Welcome to the `py-cicd` project, a comprehensive example of a DevOps Continuous Integration and Continuous Deployment (CI/CD) pipeline using GitLab CI. This project automates the testing, building, publishing, and deploying processes of a Python Flask application. The demo Python Flask app used in this project can be found at [python-demoapp](https://github.com/benc-uk/python-demoapp).

## Project Structure

The project consists of various files and directories that are essential for the CI/CD process.

```bash
.
├── CONTRIBUTING.md
├── deploy
│   ├── docker-compose.yml
│   └── nginx.conf
├── docker-compose.yml
├── dockerfile
├── LICENSE
├── makefile
├── nginx.conf
├── README.md
├── src
│   ├── app
│   │   ├── apis.py
│   │   ├── conftest.py
│   │   ├── __init__.py
│   │   ├── static
│   │   ├── templates
│   │   ├── tests
│   │   └── views.py
│   ├── requirements.txt
│   └── run.py
└── tests
```

# CI/CD Workflow Overview

The GitLab CI workflow automates the testing, building, publishing, and deployment of the Python Flask application. The workflow includes the following stages:

### Stage 1: Test

- Runs unit tests for the application.

### Stage 2: Build and Publish Image

- Builds a Docker image of the Python Flask application.
- Publishes the image to AWS ECR (Elastic Container Registry).

### Stage 3: Deploy

- Deploys the application using Docker Compose and NGINX.
- Utilizes SSH to copy deployment files and execute deployment commands remotely.

### Stage 4: End-to-End Tests

- Runs end-to-end tests on the deployed application.

# Docker Compose and NGINX Configuration

### Scaling and Load Balancing

In the `docker-compose.yml` file, the services are defined, including the `app` service, which corresponds to the Python Flask application. Notably, the `nginx` service is also defined, responsible for the NGINX reverse proxy.

One of the key features of this project is the ability to scale the `app` service using Docker Compose, allowing multiple instances of the application to run concurrently. This is achieved using the command:

```
docker compose up -d --scale app=5
```

Here, the `--scale app=5` flag indicates that five instances of the `app` service will be launched.

### Load Balancing with NGINX

The deployed instances of the Python Flask application are load balanced using NGINX. The NGINX service defined in the `docker-compose.yml` file is configured as a reverse proxy, directing incoming requests to the various instances of the `app` service.

The configuration is facilitated through the `nginx.conf` file, which defines the upstream server as `app:8080`. This configuration ensures that NGINX distributes incoming traffic across the scaled instances of the Python Flask application.

This load balancing strategy enhances the application's availability, fault tolerance, and performance by distributing incoming requests among multiple instances, allowing for efficient utilization of resources.

# Dockerfile

The `Dockerfile` specifies the steps for building the application image. It sets up the working directory, installs dependencies, and defines how the app should be executed.
