variable "private_subnets" {
  description = "Private subnet IDs used to place the database subnet group."
  type        = list(string)
}

variable "identifier" {
  description = "Identifier assigned to the RDS instance."
  type        = string
}

variable "subnet_group_name" {
  description = "Name of the RDS subnet group."
  type        = string
}

variable "username" {
  description = "Master username for the RDS instance."
  type        = string
}

variable "password" {
  description = "Master password for the RDS instance."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags applied to RDS resources."
  type        = map(string)
  default     = {}
}