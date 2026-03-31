module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  # Production High Availability Logic
  enable_nat_gateway     = true
  single_nat_gateway     = var.environment == "prod" ? false : true
  one_nat_gateway_per_az = var.environment == "prod" ? true : false

  # Advanced Features: VPC Endpoints (Saves NAT costs)
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  # VPC Flow Logs (Sent to CloudWatch by default in this wrapper)
  enable_flow_log                = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true

  tags = merge(var.tags, {
    ManagedBy = "RankHex-Terraform"
    Env       = var.environment
  })
}
