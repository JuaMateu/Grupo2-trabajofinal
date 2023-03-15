module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name = var.name

  cidr = "10.0.0.0/16"

  azs = ["us-east-1a", "us-east-1b"]

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24"]
  #permite que las subnet privadas vayan a internet para responder peticiones o actulizar los nodos
  enable_nat_gateway = true
  #crea  nat_gateway en todas las subnet privadas para alta disponibilidad
  single_nat_gateway = true
  create_igw         = true

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}