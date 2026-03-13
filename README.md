# module-ter

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

## Reusing this same folder for a brand-new AWS account

Yes — you can reuse the same `MODULE-TER` folder safely for a completely new AWS account.

What matters is **state and backend configuration**, not the folder name itself.

The previous playground work will not affect a new account **as long as you start with a clean local workspace** and create a new backend for the new account.

Things from the old account that can affect your next run locally are only:

- `.terraform/`
- `backend.hcl`
- `terraform.tfvars`
- any local `terraform.tfstate*`
- any old `tfplan`

These are intentionally ignored by git, so they are not part of the reusable project source.

### Clean-start steps for a new AWS account

From inside `MODULE-TER/`:

```bash
bash scripts/setup-new-account.sh
```

Then:

1. Update `bootstrap/terraform.tfvars` with **new-account values**
2. Create the backend resources from `bootstrap/`
3. Update `backend.hcl` with the real bucket/table names created for that account
4. Confirm the target region (currently defaulted to `ap-south-1`) and run `terraform init -reconfigure -backend-config=backend.hcl`
5. Continue with `terraform plan` / `terraform apply`

If you run `terraform plan` before step 4, Terraform will fail with:

```bash
Error: Backend initialization required
```

That is expected until the backend has been initialized with `terraform init`.

If this is a brand-new account and there is no old state to preserve, use:

```bash
terraform init -reconfigure -backend-config=backend.hcl
```

If you are migrating existing local state into the new backend, use:

```bash
terraform init -migrate-state -backend-config=backend.hcl
```

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

## Recommended first-time workflow in a new account

```bash
bash scripts/reset-local-workspace.sh
bash scripts/setup-new-account.sh

# edit the generated local files
# for this new account, the examples are already set to ap-south-1

terraform -chdir=bootstrap init
terraform -chdir=bootstrap apply
terraform init -reconfigure -backend-config=backend.hcl
terraform plan
```