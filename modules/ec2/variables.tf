variable ec2name {
    type = string
    description = "ec2 instance name"
}
variable ec2_security_gruop {
    type = list(string)
    description = "A list of security group IDs to associate with"
}
variable vpc_private_subnet {
    type = string
    description = "The VPC Subnet ID to launch in"
}
variable user_data {
    type = string
    description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
}
variable "environment" {
    description = "The name of the environment."
    type        = string
}