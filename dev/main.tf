# module "vpc" {
#   source = "../modules/vpc"
#   vpc_name = var.vpc_name
#   vpc_cidr = var.vpc_cidr
#   vpc_azs = var.vpc_azs
#   vpc_private_subnets = var.vpc_private_subnets
#   vpc_enable_nat_gateway = var.vpc_enable_nat_gateway
# }

module "vpc" {
  source  = "../modules/vpc"


  name = "dev-proyecto-vpc"

  cidr = "10.0.0.0/16"

  azs = ["us-east-1a", "us-east-1b"]

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24"]
  #permite que las subnet privadas vayan a internet para responder peticiones o actulizar los nodos
  enable_nat_gateway = true
  #crea  nat_gateway en todas las subnet privadas para alta disponibilidad
  single_nat_gateway = false

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

# module "eks" {
#   source = "../modules/eks"
# }

# module "security-group" {
#   source = "../modules/security-group"
#   }

# module "iam" {
#   source = "../modules/iam"
#   }
# module "ec2-instance" {
#   source = "../modules/ec2-instance"
#   }