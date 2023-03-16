variable "eks_name" {
  type = string
  description = "value for the 'Name' tag of the VPC"
}
variable "environment" {
  description = "The name of the environment."
  type        = string
}
variable "vpc_id" {
  description = "id of the vpc"
  type        = string
}
variable "private_subnets" {
  description = "id of the private_subnets"
  type        = list(string)
}
