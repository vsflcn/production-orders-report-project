# Production Orders Report Project

This project demonstrates how to deploy an application that reports unaccounted materials in production orders for the current day. The stack includes Terraform, Ansible, Docker, Kubernetes, Jenkins, and AWS.

## Setup and Deployment Guide

### Prerequisites

- AWS Account with proper IAM permissions.
- Terraform installed.
- Ansible installed.
- Docker installed.
- Kubernetes cluster.
- Jenkins installed on an Ubuntu server.

### Step 1: Terraform - Infrastructure Setup

1. Navigate to the `terraform/` directory.
2. Initialize Terraform:
    ```sh
    terraform init
    ```
3. Apply the Terraform configuration to create the infrastructure:
    ```sh
    terraform apply
    ```

### Step 2: Ansible - Server Configuration

1. Navigate to the `ansible/` directory.
2. Run the playbook to configure the Jenkins server:
    ```sh
    ansible-playbook -i inventory.ini playbook.yml
    ```

### Step 3: Docker - Build and Push Image

1. Navigate to the `docker/` directory.
2. Build the Docker image:
    ```sh
    docker build -t your-dockerhub-username/report-app:latest .
    ```
3. Push the Docker image to DockerHub:
    ```sh
    docker push your-dockerhub-username/report-app:latest
    ```

### Step 4: Kubernetes - Deploy Application

1. Navigate to the `kubernetes/` directory.
2. Apply the Kubernetes deployment and service:
    ```sh
    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml
    ```

### Step 5: Jenkins - CI/CD Pipeline

1. Configure Jenkins to use the pipeline defined in `jenkins/Jenkinsfile`.
2. Set up credentials for DockerHub in Jenkins.
3. Run the Jenkins pipeline to automate the build, push, and deployment process.

## Application

The application will be accessible via the Kubernetes service load balancer. It provides a report of unaccounted materials in production orders for the current day.

## License

This project is licensed under the MIT License.
