#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Resetting local Terraform workspace under: ${ROOT_DIR}"

rm -rf "${ROOT_DIR}/.terraform"
rm -rf "${ROOT_DIR}/bootstrap/.terraform"

rm -f "${ROOT_DIR}/backend.hcl"
rm -f "${ROOT_DIR}/terraform.tfvars"
rm -f "${ROOT_DIR}/bootstrap/terraform.tfvars"

rm -f "${ROOT_DIR}/terraform.tfstate"
rm -f "${ROOT_DIR}/terraform.tfstate.backup"
rm -f "${ROOT_DIR}/tfplan"
rm -f "${ROOT_DIR}"/*.tfplan
rm -f "${ROOT_DIR}/.terraform.tfstate.lock.info"

echo "Local Terraform cache, local state, plan files, and account-specific overrides removed."
echo "Next steps:"
echo "  1. cp bootstrap/terraform.tfvars.example bootstrap/terraform.tfvars"
echo "  2. cp terraform.tfvars.example terraform.tfvars"
echo "  3. cp backend.hcl.example backend.hcl"
echo "  4. update values for the new AWS account"