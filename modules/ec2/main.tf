module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = var.ec2name

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "jenkins-key"
  
  vpc_security_group_ids = var.ec2_security_gruop
  subnet_id              = var.vpc_private_subnet
  user_data              = var.user_data

  tags = {
    Terraform   = "true"
    Name        = var.ec2_name
    Environment = var.environment
  }
}