resource "aws_ssm_parameter" "this" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.vpc-made-easy.vpc_id
}

resource "aws_ssm_parameter" "pub_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/pub_subnet_ids"
  type  = "StringList"
  value = module.vpc-made-easy.pub_subnet_ids
}

resource "aws_ssm_parameter" "pri_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/pri_subnet_ids"
  type  = "StringList"
  value = module.vpc-made-easy.pri_subnet_ids
}

resource "aws_ssm_parameter" "db_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/db_subnet_ids"
  type  = "StringList"
  value = module.vpc-made-easy.pub_subnet_ids
}

module "vpc-made-easy" {
  # source                = "../08.Terraform-AWS-VPC-IGW-Subnets-Peering"
  source                = "git::https://github.com/kalidindi-naveen/Learn-TF-Modules.git//08.Terraform-AWS-VPC-IGW-Subnets-Peering?ref=main"
  common_tags           = var.common_tags
  project_name          = var.project_name
  cidr_block            = var.cidr_block
  environment           = var.environment
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  enable_peering        = var.enable_peering
}