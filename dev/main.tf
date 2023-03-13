module "vpc" {
  source = "../modules/vpc"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  vpc_azs = var.vpc_azs
  vpc_private_subnets = var.vpc_private_subnets
  vpc_enable_nat_gateway = var.vpc_enable_nat_gateway
}


module "eks" {
  source = "../modules/eks"
}

module "security-group" {
  source = "../modules/security-group"
  }

module "iam" {
  source = "../modules/iam"
  }
module "ec2-instance" {
  source = "../modules/ec2-instance"
  }