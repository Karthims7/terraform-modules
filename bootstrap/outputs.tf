output "terraform_state_bucket_name" {
  description = "Name of the S3 bucket used to store Terraform state."
  value       = module.backend.bucket_name
}

output "terraform_state_bucket_arn" {
  description = "ARN of the S3 bucket used to store Terraform state."
  value       = module.backend.bucket_arn
}

output "terraform_lock_table_name" {
  description = "Name of the DynamoDB table used for Terraform state locking."
  value       = module.backend.dynamodb_table_name
}

output "terraform_lock_table_arn" {
  description = "ARN of the DynamoDB table used for Terraform state locking."
  value       = module.backend.dynamodb_table_arn
}