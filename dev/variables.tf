variable "vpc_name" {
  type = string
  description = "value for the 'Name' tag of the VPC"
}

variable "environment" {
    description = "The name of the environment."
    type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "secret aws access key"
  default = ""
}

variable "AWS_ACCESS_KEY_ID" {
  description = "aws acces key ID"
  default = ""
}