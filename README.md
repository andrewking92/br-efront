# Terraform Modules Repository

This Git repository contains Terraform modules for managing infrastructure across different environments: POC, Dev, UAT, and Prod. These modules are designed to help provision and manage resources in a consistent and repeatable manner across multiple environments.

## Table of Contents

- [MongoDB Atlas](#mongodb-atlas)
  - [API Keys](#api-keys)
- [Azure](#azure)
  - [Subscription](#subscription)
- [Usage](#usage)


## MongoDB Atlas

### API Keys

API Keys can be generated via the UI or Admin API. To do so via the UI, follow these steps:

1. Navigate to the Organisation settings for org access, or Project settings to grant access to a specific project.

2. Go to Access Manager and follow the API Keys tab.

3. Create an API key with the appropriate organisation or project level permissions.

4. Whitelist the IP address where the Terraform script will be run.

5. Store the Keys Securely: Once you have retrieved the keys, store them securely as environment variables or in a secure location for use in your Terraform configurations.

6. **Required Environment Variables**: To authenticate and provision resources in your target environment, you need to set the following environment variables:

   ```sh
   export MONGODB_ATLAS_PUBLIC_KEY=<PUBLIC_KEY>
   export MONGODB_ATLAS_PRIVATE_KEY=<PRIVATE_KEY>
   ```


## Azure

### Subscription

Before you begin using these Terraform modules, ensure that you have the following prerequisites in place:

1. Login via the Azure CLI and copy the id field from the response.

   ```sh
   az login
   
   az account set --subscription "<subscription-id>"
   
   az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<subscription-id>"
   ```


3. **Required Environment Variables**: To authenticate and provision resources in your target environment, you need to set the following environment variables:

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