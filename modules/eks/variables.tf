variable "eks_name" {
  type = string
  description = "value for the 'Name' tag of the VPC"
}
variable "environment" {
  description = "The name of the environment."
  type        = string
}
