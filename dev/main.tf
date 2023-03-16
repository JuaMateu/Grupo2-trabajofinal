module "vpc" {
  source = "../modules/vpc"

  name        = var.vpc_name
  environment = var.environment

}

module "ec2-instance" {
  source       = "../modules/ec2"
  ec2_name     = "dev-jenkins-ec2"
  subnet_id    = module.vpc.private_subnets[0]
  key_name     = "dev-jenkins-key"
  #traer de modulo security group
  # vpc_security_group_ids = var.ec2_security_group 
  user_data    = <<EOF
    #!/bin/bash
    echo "Instalacion para servidor de jenkins"
    EOF
  # tags
  environment  = var.environment
}

module "eks" {
  source       = "../modules/eks"
  name         = var.eks_name
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