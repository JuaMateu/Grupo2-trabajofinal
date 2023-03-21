module "vpc" {
  source = "../modules/vpc"

  name        = var.vpc_name
  environment = var.environment

}

module "ec2-instance" {
  source       = "../modules/ec2"
  ec2_name     = "dev-jenkins-ec2"
  subnet_id    = module.vpc.private_subnets[0]
  key_name     = var.ec2_key_name

  vpc_security_group_ids = [module.security-group_ec2.sg-id]
  #traer de modulo security group
  # vpc_security_group_ids = var.ec2_security_group 
  user_data    = "${file("../dockerinstall.sh")}"
  # tags
  environment  = var.environment

}

# module "eks" {
#   source       = "../modules/eks"
#   eks_name         = var.eks_name
#   environment = var.environment
#   vpc_id = module.vpc.vpc_id
#   private_subnets = module.vpc.private_subnets
#   private_subnets_control_plane = module.vpc.private_subnets
# }

module "security-group_ec2" {
    source = "../modules/security-group"

    vpc_id = module.vpc.vpc_id

    environment = var.environment
    sg_name     = var.sg_name
}

resource "aws_elb" "elb" {
  name               = "dev-elb"
  subnets            = module.vpc.private_subnets
  security_groups    = [module.security-group_ec2.sg-id]
  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 8080
    lb_protocol       = "http"
  }
    listener {
    instance_port     = 22
    instance_protocol = "tcp"
    lb_port           = 2222
    lb_protocol       = "tcp"
  }
}

resource "aws_security_group" "sg-elb" {
  name_prefix = "elb-"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb_attachment" "ec2attachment" {
  elb               = aws_elb.elb.id
  instance         = module.ec2-instance.jenkins-id

}





#  module "eks" {
# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "~> 19.0"

#   cluster_name    = "my-cluster"
#   cluster_version = "1.24"

#   cluster_endpoint_public_access  = true

#   cluster_addons = {
#     coredns = {
#       most_recent = true
#     }
#     kube-proxy = {
#       most_recent = true
#     }
#     vpc-cni = {
#       most_recent = true
#     }
#   }

#   vpc_id                   = "vpc-06000508380c4e80c"
#   subnet_ids               = ["subnet-0df0dfcf66046819e","subnet-0f5f611df2df1a5b2"] #siempre privada
#   control_plane_subnet_ids = ["subnet-0df0dfcf66046819e","subnet-0f5f611df2df1a5b2"] #usar outputs para obtener este valor


#   eks_managed_node_groups = {
#     green = {
#       min_size     = 1
#       max_size     = 3
#       desired_size = 1

#       instance_types = ["t2.micro"]
#       capacity_type  = "SPOT"
#     }cim
#   }
# }
#  }

# module "security-group" {
#   source = "../modules/security-group"
#   }

# module "iam" {
#   source = "../modules/iam"
#   }
# module "ec2-instance" {
#   source = "../modules/ec2-instance"
#   }