module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "my-cluster"
  cluster_version = "1.24"

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = "vpc-06000508380c4e80c"
  subnet_ids               = ["subnet-0df0dfcf66046819e","subnet-0f5f611df2df1a5b2"] #siempre privada
  control_plane_subnet_ids = ["subnet-0df0dfcf66046819e","subnet-0f5f611df2df1a5b2"] #usar outputs para obtener este valor

  
  eks_managed_node_groups = {
 
    green = {
      min_size     = 1
      max_size     = 3
      desired_size = 1

      instance_types = ["t2.micro"]
      capacity_type  = "SPOT"
    }
  }
}

# ╷
# │ Error: error waiting for EKS Node Group (my-cluster:green-2023031519180150690000000e) to create: unexpected state 'CREATE_FAILED', wanted target 'ACTIVE'. 
#   last error: 1 error occurred:
# │       * i-0041dbeca51f772c1, i-07f1b6553c34919d0: NodeCreationFailure: Instances failed to join the kubernetes cluster
# │ 
# │ 
# │ 
# │   with module.eks.module.eks_managed_node_group["green"].aws_eks_node_group.this[0],
# │   on .terraform/modules/eks/modules/eks-managed-node-group/main.tf line 308, in resource "aws_eks_node_group" "this":
# │  308: resource "aws_eks_node_group" "this" {
# │ 
# ╵