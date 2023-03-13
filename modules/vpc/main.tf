module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs = var.vpc_azs
  enable_nat_gateway = var.vpc_enable_nat_gateway

  private_subnets = var.vpc_private_subnets
  public_subnets = var.vpc_publc_subnets

  tags = {
    Terraform = "true"
    Environment = var.environment
  }
}
