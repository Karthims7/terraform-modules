variable "vpc_id" {
  description = "VPC identifier where the ALB security group will be created."
  type        = string
}

variable "public_subnets" {
  description = "Public subnet IDs used by the Application Load Balancer."
  type        = list(string)
}

variable "name" {
  description = "Name of the Application Load Balancer."
  type        = string
}

variable "security_group_name" {
  description = "Name of the ALB security group."
  type        = string
}

variable "tags" {
  description = "Tags applied to ALB resources."
  type        = map(string)
  default     = {}
}