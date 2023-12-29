#!/bin/sh

set -e

# Terraform quality gates
#
echo "Execute terraform init..."
terraform init

echo "Execute terraform fmt..."
terraform fmt --recursive

echo "Execute terraform-docs..."
terraform-docs markdown --output-file TERRAFORM.md .

echo "Execute terraform security scan..."
tfsec .

echo "Execute terraform lint..."
tflint --init
tflint . --force

echo "Validate examples..."
echo "  externalized"
terraform --chdir=./examples/externalized init
terraform --chdir=./examples/externalized validate
terraform --chdir=./examples/externalized plan