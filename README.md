# Infrastructure as Code with Terraform

This repository contains Terraform configurations for deploying a sample API with multiple replicas and its database using Azure Kubernetes Service (AKS) as the orchestrator and Azure Database for PostgreSQL as the database solution. The infrastructure is deployed across multiple environments - development (dev), staging, and production (prod).

## Table of Contents

- [Introduction](#introduction)
- [Infrastructure Overview](#infrastructure-overview)
- [Getting Started](#getting-started)
- [Testing](#testing)

## Introduction

The infrastructure is provisioned using Terraform, which allows for Infrastructure as Code (IaC) practices. It defines the infrastructure resources in a declarative way, making it easy to manage and replicate across environments.

## Infrastructure Overview

The deployment includes the following components:

- Azure Kubernetes Service (AKS) for orchestrating the sample API deployment
- Azure Database for PostgreSQL for storing data
- Docker images for the sample API
- Helm charts for managing Kubernetes resources
- Terraform configurations for provisioning resources
- Azure Storage Account for Terraform state storage
- The `dev`, `staging`, and `prod` folders contain environment-specific Terraform configurations.
- The `modules` folder contains reusable Terraform modules for different resources.
- Each environment folder contains a `main.tf` file with environment-specific configurations.

## Getting Started

1. Clone this repository to your local machine.
2. Replace the placeholder values for Azure subscription ID, tenant ID, client ID, and client secret in the `main.tf` files within each environment folder (`dev`, `staging`, `prod`) with your actual Azure credentials.
3. Navigate to the desired environment folder (e.g., `dev`) and initialize Terraform by running the following command: terraform init
4. Review the Terraform plan by running: terraform apply
   Confirm the changes when prompted.

## Testing

After deploying the infrastructure, test the deployed services to ensure they are working as expected.
