variable "name" {
  type = string
  description = "value for the 'Name' tag of the VPC"
}
variable "cidr" {
  type = string
  description = "CIDR block for the VPC"
}
variable "azs" {
  type = list(string)
  description = "Availability Zones for the VPC"
}
variable "private_subnets" {
  type = list(string)
  description = "CIDR blocks for the private subnets"
}
variable "public_subnets" {
  type = list(string)
  description = "CIDR blocks for the public subnets"
}
variable "enable_nat_gateway" {
  type = bool
  description = "whether to enable NAT gateways for the private subnets"
}
variable "environment" {
  type = string
  description = "environment name"
  default = "dev"
}