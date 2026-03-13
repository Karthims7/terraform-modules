#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Preparing local files for a new AWS account in: ${ROOT_DIR}"

bash "${ROOT_DIR}/scripts/reset-local-workspace.sh"

cp "${ROOT_DIR}/bootstrap/terraform.tfvars.example" "${ROOT_DIR}/bootstrap/terraform.tfvars"
cp "${ROOT_DIR}/terraform.tfvars.example" "${ROOT_DIR}/terraform.tfvars"
cp "${ROOT_DIR}/backend.hcl.example" "${ROOT_DIR}/backend.hcl"

echo
echo "Created local working files:"
echo "  - bootstrap/terraform.tfvars"
echo "  - terraform.tfvars"
echo "  - backend.hcl"
echo
echo "Next steps:"
echo "  1. Edit bootstrap/terraform.tfvars"
echo "  2. Edit terraform.tfvars"
echo "  3. Edit backend.hcl"
echo "  4. Run: terraform -chdir=bootstrap init"
echo "  5. Run: terraform -chdir=bootstrap apply"
echo "  6. Run: terraform init -reconfigure -backend-config=backend.hcl"
echo "  7. Run: terraform plan"