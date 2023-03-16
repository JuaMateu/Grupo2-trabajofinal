module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = var.ec2_name

  ami                    = "ami-0557a15b87f6559cf"
  instance_type          = "t2.micro"
  key_name               = var.key_name
  
  # vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  user_data              = var.user_data

  tags = {
    Terraform   = "true"
    Name        = var.ec2_name
    Environment = var.environment
  }
}