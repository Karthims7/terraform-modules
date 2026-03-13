# module-ter

Enterprise-style Terraform codebase for AWS infrastructure using reusable modules and simple local Terraform state.

## Structure

```text
.
├── modules/
│   ├── alb/
│   ├── nat/
│   ├── rds/
│   └── vpc/
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
└── versions.tf
```

## Reusing this same folder for a brand-new AWS account

Yes — you can reuse the same `MODULE-TER` folder safely for a completely new AWS account.

What matters is your **local state and tfvars**, not the folder name itself.

The previous playground work will not affect a new account **as long as you start with a clean local workspace**.

Things from the old account that can affect your next run locally are only:

- `.terraform/`
- `terraform.tfvars`
- any local `terraform.tfstate*`
- any old `tfplan`

These are intentionally ignored by git, so they are not part of the reusable project source.

### Clean-start steps for a new AWS account

From inside `MODULE-TER/`:

```bash
bash scripts/reset-local-workspace.sh
cp terraform.tfvars.example terraform.tfvars
```

Then:

1. Update `terraform.tfvars` with values for the new account
2. Run `terraform init`
3. Run `terraform plan`
4. Run `terraform apply`

## Standard workflow

```bash
cp terraform.tfvars.example terraform.tfvars
# edit terraform.tfvars

terraform init
terraform plan
terraform apply
```

## Local state note

This project now uses Terraform's default local state behavior.

- no S3 backend
- no DynamoDB lock table
- no bootstrap stack

That makes first-time setup much simpler for a fresh account.

## Recommended first-time workflow

```bash
bash scripts/reset-local-workspace.sh
cp terraform.tfvars.example terraform.tfvars

# edit terraform.tfvars

terraform init
terraform plan
```