module "vpc" {
  source  = "../modules/vpc"

  name = var.vpc_name
  environment = var.environment

}
# module "ec2-instance" {
#   source  = "../modules/ec2"
#   name = "dev-jenkins-ec2"
#   private_subnets = module.vpc_root.private_subnets_id[0]
#   security_group         = 

  # }
