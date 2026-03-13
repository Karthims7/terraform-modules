variable "bucket_name" {
  description = "Globally unique S3 bucket name for storing Terraform state."
  type        = string
}

variable "dynamodb_table" {
  description = "DynamoDB table name used for Terraform state locking."
  type        = string
}

variable "force_destroy" {
  description = "Allow bucket deletion even when objects remain inside it."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to backend resources."
  type        = map(string)
  default     = {}
}