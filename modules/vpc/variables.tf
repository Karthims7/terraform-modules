variable "vpc_name" {
  description = "Name of the VPC."
  type        = string
}

variable "cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "azs" {
  description = "Availability zones used by the VPC module."
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR ranges for public subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR ranges for private subnets."
  type        = list(string)
}

variable "tags" {
  description = "Common tags applied to VPC resources."
  type        = map(string)
  default     = {}
}