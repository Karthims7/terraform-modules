variable "aws_region" {
  description = "AWS region where infrastructure will be provisioned."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Logical project name used for tagging and naming resources."
  type        = string
  default     = "demo"
}

variable "environment" {
  description = "Deployment environment name used in resource naming and tagging."
  type        = string
  default     = "dev"
}

variable "vpc_name" {
  description = "Name of the VPC resource."
  type        = string
  default     = "demo-vpc"
}

variable "cidr" {
  description = "Primary CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones used by the VPC module."
  type        = list(string)
  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}

variable "public_subnets" {
  description = "CIDR ranges for public subnets."
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "private_subnets" {
  description = "CIDR ranges for private subnets."
  type        = list(string)
  default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}

variable "db_username" {
  description = "Master username for the PostgreSQL instance."
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Master password for the PostgreSQL instance."
  type        = string
  sensitive   = true
}