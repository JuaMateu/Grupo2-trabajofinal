# variables vpc
variable "vpc_name" {
  type        = string
  description = "value for the 'Name' tag of the VPC"
}
# variables multiples
variable "environment" {
  description = "The name of the environment."
  type        = string
}
# variables ec2
variable "ec2_key_name" {
  description = "the name of the key_pair for connect to EC2 instance"
  type        = string
}
variable "ec2_name" {
  description = "The name of the EC2 instance."
  type        = string
}
# variables eks
variable "eks_name" {
  type        = string
  description = "value for the 'Name' tag of the VPC"
}
#variables SG
variable "sg_name" {
  type        = string
  description = "value for the 'Name' tag of the Security Group"
  default = "jenkins-security-group"
}
# variable "sg-id" {
#   type        = string
#   description = "Security groups's ID"
# }
variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  default = ""
}
variable "AWS_ACCESS_KEY_ID" {
  type        = string
  default = ""
}