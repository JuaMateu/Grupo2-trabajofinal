  vpc_name = "dev-vpc-g2"
  vpc_cidr ="10.0.0.0/16"
  vpc_azs = ["eu-west-1a", "eu-west-1b"]
  vpc_private_subnets = ["10.0.2.0/24"]
  vpc_public_subnets = ["10.0.1.0/24"]
  vpc_enable_nat_gateway = false