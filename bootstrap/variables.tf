variable "aws_region" {
  description = "AWS region where the Terraform backend resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Logical project name used in tagging and naming backend resources."
  type        = string
  default     = "demo"
}

variable "environment" {
  description = "Environment name used in backend resource naming."
  type        = string
  default     = "dev"
}

variable "backend_bucket_name" {
  description = "Globally unique S3 bucket name for Terraform remote state storage."
  type        = string
  default     = "module-ter-demo-dev-tfstate-730335390054"
}

variable "backend_dynamodb_table" {
  description = "DynamoDB table name used for Terraform state locking."
  type        = string
  default     = "module-ter-demo-dev-tf-locks"
}