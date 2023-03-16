variable "vpc_name" {
  type        = string
  description = "value for the 'Name' tag of the VPC"
}

variable "environment" {
  description = "The name of the environment."
  type        = string
}
variable "ec2_name" {
  description = "The name of the EC2 instance."
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "secret aws access key"
  default     = ""
}

variable "AWS_ACCESS_KEY_ID" {
  description = "aws acces key ID"
  default     = ""
}