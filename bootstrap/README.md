# Terraform Backend Bootstrap

This stack creates the remote state infrastructure for the main Terraform configuration:

- An S3 bucket to store the Terraform state file
- A DynamoDB table to coordinate state locking

## Usage

1. Create the backend resources first:

   ```bash
   terraform -chdir=bootstrap init
   terraform -chdir=bootstrap apply
   ```

2. Initialize the main stack with the generated backend settings:

   ```bash
   terraform init -reconfigure -backend-config=backend.hcl.example
   ```

## Important Note

Terraform state is stored in **S3**.
DynamoDB is used for **state locking**, not for storing the state file itself.