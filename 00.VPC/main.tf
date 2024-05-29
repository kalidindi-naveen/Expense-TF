resource "aws_ssm_parameter" "foo" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.vpc-made-easy.vpc_id
}

module "vpc-made-easy" {
  # source                = "../08.Terraform-AWS-VPC-IGW-Subnets-Peering"
  source                = "git::https://github.com/kalidindi-naveen/Learn-TF-Modules.git//08.Terraform-AWS-VPC-IGW-Subnets-Peering?ref=main"
  common_tags           = var.common_tags
  project_name          = var.project_name
  cidr_block            = var.cidr_block
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  enable_peering        = var.enable_peering
}