# terraform-infra

Enterprise-style Terraform codebase for AWS infrastructure with reusable modules and a separate bootstrap stack for remote state resources.

## Structure

```text
.
├── backend.tf
├── backend.hcl.example
├── bootstrap/
├── modules/
│   ├── alb/
│   ├── backend/
│   ├── nat/
│   ├── rds/
│   └── vpc/
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
└── versions.tf
```

## Workflow

### 1. Create backend infrastructure

```bash
terraform -chdir=bootstrap init
terraform -chdir=bootstrap apply
```

### 2. Initialize the main stack with remote state

```bash
cp backend.hcl.example backend.hcl
terraform init -reconfigure -backend-config=backend.hcl
```

### 3. Configure deployment variables

```bash
cp terraform.tfvars.example terraform.tfvars
```

### 4. Plan and apply

```bash
terraform plan
terraform apply
```

## Backend design

- **S3** stores the Terraform state file
- **DynamoDB** provides state locking

DynamoDB does not store the Terraform state itself.