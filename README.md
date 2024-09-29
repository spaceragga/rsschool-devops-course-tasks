# Infrastructure Setup and Usage

This README provides an overview of the infrastructure setup using Terraform for deploying resources on AWS, specifically targeting GitHub Actions integration.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Configuration Files](#configuration-files)
- [Steps to Set Up the Infrastructure](#steps-to-set-up-the-infrastructure)
- [Usage](#usage)
- [Outputs](#outputs)
- [Cleaning Up](#cleaning-up)

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (version 1.0 or later)
- [AWS CLI](https://aws.amazon.com/cli/) (configured with appropriate permissions)
- [GitHub Account](https://github.com/)
- [AWS Account](https://aws.amazon.com/)


## Configuration Files

### 1. `main.tf`

This file contains the main Terraform configuration, including the definition for the GitHub Actions OIDC provider and the IAM role used for GitHub Actions.

### 2. `variables.tf`

This file defines the necessary variables used throughout the Terraform configurations.

### 3. `outputs.tf`

This file specifies the outputs that Terraform will provide after running the `apply` command.

### 4. `resource.tf`

This file contains the resource definitions, including the S3 bucket, IAM role policy attachments, and server-side encryption configurations.

### 5. `provider.tf`

This file specifies the provider configuration, ensuring that Terraform knows which provider (AWS) to use and the region for deployments.

## Steps to Set Up the Infrastructure

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name

2. **Configure AWS CLI**

Ensure that your AWS CLI is configured with the necessary permissions:

    aws configure
    
You will need to provide your AWS Access Key, Secret Key, default region, and output format.

3. **Initialize Terraform**

Run the following command to initialize the Terraform project:

    terraform init

4. **Add variables for bucket**

    ```bucket = "devops-second"```

5. **Plan the Infrastructure**

Check what resources will be created by running:

    terraform plan


6. **Apply the Infrastructure Changes**

To create the resources defined in your Terraform files, run:

    terraform apply

Type yes when prompted to confirm the changes.

## Usage

After successful deployment, the following resources will be created:
    - An S3 bucket for Terraform state management.
    - An IAM role configured for GitHub Actions with appropriate permissions.
    - An OIDC provider for secure authentication with GitHub Actions.

## Outputs

You can view the outputs by running:

    terraform output

This will display the ARN of the GitHub Actions role and the name and region of the S3 bucket.

## Cleaning Up

To remove all resources created by Terraform, you can run:

    terraform destroy

Again, type yes when prompted to confirm the deletion of all resources.