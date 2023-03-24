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
  description = "id of the public_subnets"
  type        = list(string)
}

variable "private_subnets_control_plane" {
    description = "The public subnets id for the control plane"
    type = list(string)
}