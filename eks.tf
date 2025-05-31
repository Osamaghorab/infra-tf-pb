module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.36.0"
  cluster_name = "micsvc-eks-cluster"
  cluster_version = "1.32"


  cluster_endpoint_public_access = true
  subnet_ids = module.micsvc-vpc.private_subnets
  vpc_id = module.micsvc-vpc.vpc_id
  
  eks_managed_node_groups = {
    dev = {
      instance_types = ["t3.large"]

      min_size     = 1
      max_size     = 3
      desired_size = 3
    }
  }



  tags = {
    Environment = "dev"
    Terraform   = "true"
  }



}