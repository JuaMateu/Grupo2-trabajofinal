module "vpc" {
  source = "../modules/vpc"

  name        = var.vpc_name
  environment = var.environment

}

module "ec2-instance" {
  source       = "../modules/ec2"
  ec2_name     = "dev-jenkins-ec2"
  subnet_id    = module.vpc.public_subnets[0]
  key_name     = var.ec2_key_name

  vpc_security_group_ids = [module.security-group_ec2.sg-id]
  #traer de modulo security group
  # vpc_security_group_ids = var.ec2_security_group 
  user_data    = "${file("../dockerinstall.sh")}"
  # tags
  environment  = var.environment

}

module "eks" {
  source       = "../modules/eks"
  eks_name         = var.eks_name
  environment = var.environment
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  public_subnets_control_plane = module.vpc.public_subnets
}

module "security-group_ec2" {
    source = "../modules/security-group"

    vpc_id = module.vpc.vpc_id

    environment = var.environment
    sg_name     = var.sg_name
}

# resource "aws_elb" "elb" {
#   name               = "dev-elb"
#   subnets            = module.vpc.private_subnets
#   security_groups    = [module.security-group_ec2.sg-id]
#   listener {
#     instance_port     = 8080
#     instance_protocol = "http"
#     lb_port           = 8080
#     lb_protocol       = "http"
#   }
#     listener {
#     instance_port     = 22
#     instance_protocol = "tcp"
#     lb_port           = 2222
#     lb_protocol       = "tcp"
#   }
# }

# resource "aws_security_group" "sg-elb" {
#   name_prefix = "elb-"
#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_elb_attachment" "ec2attachment" {
#   elb               = aws_elb.elb.id
#   instance         = module.ec2-instance.jenkins-id

# }

