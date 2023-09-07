# Terraform Modules Repository

This Git repository contains Terraform modules for managing infrastructure across different environments: POC (Proof of Concept), Dev (Development), UAT (User Acceptance Testing), and Prod (Production). These modules are designed to help you provision and manage resources in a consistent and repeatable manner across multiple environments.

## Table of Contents

- [MongoDB Atlas](#mongodb-atlas)
  - [API Keys](#api-keys)
- [Azure](#azure)
  - [Subscription](#subscription)
- [Usage](#usage)


## MongoDB Atlas

### API Keys

To access your MongoDB Atlas public and private key pairs, you can use the Atlas Admin API. Follow these steps:

Retrieve your Atlas Organization API Key: Log in to your MongoDB Atlas account and navigate to "Organization Settings." Create an API key if you don't already have one.

Make an API Request: Use the API key to make a request to the Atlas Admin API endpoint to retrieve your public and private keys. Here's an example using curl:

curl -X GET "https://cloud.mongodb.com/api/atlas/v1.0/groups/GROUP_ID/clusters/CLUSTER_NAME/databaseUsers/adminPublicKey" -H "Content-Type: application/json" -H "Atlas-Auth: ORG_ID:API_KEY"

Replace GROUP_ID, CLUSTER_NAME, ORG_ID, and API_KEY with your specific values.

Store the Keys Securely: Once you have retrieved the keys, store them securely as environment variables or in a secure location for use in your Terraform configurations.

2. **Required Environment Variables**: To authenticate and provision resources in your target environment, you need to set the following environment variables:

   ```sh
   export MONGODB_ATLAS_PUBLIC_KEY=<PUBLIC_KEY>
   export MONGODB_ATLAS_PRIVATE_KEY=<PRIVATE_KEY>
   ```


## Azure

### Subscription

Before you begin using these Terraform modules, ensure that you have the following prerequisites in place:

1. **Terraform Installed**: Make sure you have Terraform installed on your local machine. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).


   ```sh
   az login
   
   az account set --subscription "<>"
   
   az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<>"
   ```


2. **Required Environment Variables**: To authenticate and provision resources in your target environment, you need to set the following environment variables:

   ```sh
   export ARM_CLIENT_ID=<APPID_VALUE>
   export ARM_CLIENT_SECRET=<PASSWORD_VALUE>
   export ARM_SUBSCRIPTION_ID=<SUBSCRIPTION_ID>
   export ARM_TENANT_ID=<TENANT_VALUE>
   ```


## Usage

1. Change to the desired environment directory (e.g., poc, dev, uat, or prod).

2. Initialize the Terraform configuration:
   ```sh
   terraform init
   ```

3. Use the Terraform modules as needed to create and manage your infrastructure in the chosen environment.
   ```sh
   terraform plan
   terraform apply
   ```

Note: mongodbatlas_search_index resource will fail if the database does not exist. It is necessary to be created before running the search index resource. 