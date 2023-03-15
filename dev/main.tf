module "vpc" {
  source = "../modules/vpc"
  vpc_name = "proyecto-vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_azs = ["us-east-1a", "us-east-1b"]
  vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  vpcvpc_public_subnets = ["10.0.4.0/24", "10.0.5.0/24"]
  vpc_enable_nat_gateway =true
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