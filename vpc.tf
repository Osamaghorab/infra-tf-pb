module "micsvc-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name = "micsvc-vpc"
  cidr = var.vpc_cidr_block
  public_subnets = var.public_subnets_cidr_block
  private_subnets = var.private_subnets_cidr_block
  azs = data.aws_availability_zones.available.names
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true

 tags = {
        "kubernetes.io/cluster/micsvc-eks-cluster" = "shared"
         Environment = "dev"
         Terraform   = "true"
     }
    public_subnet_tags = {
        "kubernetes.io/cluster/micsvc-eks-cluster" = "shared"
        "kubernetes.io/role/elb" = 1 
    }

    private_subnet_tags = {
        "kubernetes.io/cluster/micsvc-eks-cluster" = "shared"
        "kubernetes.io/role/internal-elb" = 1 
    }

}