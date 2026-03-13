#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Resetting local Terraform workspace under: ${ROOT_DIR}"

rm -rf "${ROOT_DIR}/.terraform"

rm -f "${ROOT_DIR}/terraform.tfvars"

rm -f "${ROOT_DIR}/terraform.tfstate"
rm -f "${ROOT_DIR}/terraform.tfstate.backup"
rm -f "${ROOT_DIR}/tfplan"
rm -f "${ROOT_DIR}"/*.tfplan
rm -f "${ROOT_DIR}/.terraform.tfstate.lock.info"

echo "Local Terraform cache, local state, plan files, and local tfvars removed."
echo "Next steps:"
echo "  1. cp terraform.tfvars.example terraform.tfvars"
echo "  2. update values for the new AWS account"
echo "  3. run terraform init"
echo "  4. run terraform plan"