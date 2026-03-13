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
   cp ../backend.hcl.example ../backend.hcl
   # update ../backend.hcl with the real values from bootstrap outputs
   terraform init -reconfigure -backend-config=backend.hcl
   ```

## New-account bootstrap notes

- The S3 bucket name must be globally unique
- Use names specific to the target AWS account/environment
- Do not reuse the old account's backend bucket/table names unless they really exist and are yours
- After bootstrap apply, use the output values to fill `../backend.hcl`

## Important Note

Terraform state is stored in **S3**.
DynamoDB is used for **state locking**, not for storing the state file itself.