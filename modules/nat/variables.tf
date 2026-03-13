variable "public_subnet" {
  description = "Public subnet ID where the NAT Gateway will be provisioned."
  type        = string
}

variable "private_route_table" {
  description = "Private route table ID that should route internet traffic through the NAT Gateway."
  type        = string
}

variable "name" {
  description = "Name assigned to the NAT Gateway resources."
  type        = string
}

variable "tags" {
  description = "Tags applied to NAT resources."
  type        = map(string)
  default     = {}
}