module "sg-made-easy-db" {
  source         = "git::https://github.com/kalidindi-naveen/Learn-TF-Modules//10.Terraform-AWS-SG?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "db"
  vpc_id         = data.aws_ssm_parameter.this.value
  sg_description = "SG For DB"
  ingress        = var.ingress
  common_tags    = var.common_tags
}

module "sg-made-easy-be" {
  source         = "git::https://github.com/kalidindi-naveen/Learn-TF-Modules//10.Terraform-AWS-SG?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "be"
  vpc_id         = data.aws_ssm_parameter.this.value
  sg_description = "SG For BE"
  ingress        = var.ingress
  common_tags    = var.common_tags
}

module "sg-made-easy-fe" {
  source         = "git::https://github.com/kalidindi-naveen/Learn-TF-Modules//10.Terraform-AWS-SG?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "fe"
  vpc_id         = data.aws_ssm_parameter.this.value
  sg_description = "SG For FE"
  ingress        = var.ingress
  common_tags    = var.common_tags
}

module "sg-made-easy-bastion" {
  source         = "git::https://github.com/kalidindi-naveen/Learn-TF-Modules//10.Terraform-AWS-SG?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "bastion"
  vpc_id         = data.aws_ssm_parameter.this.value
  sg_description = "SG For bastion"
  ingress        = var.ingress
  common_tags    = var.common_tags
}

module "sg-made-easy-ansible" {
  source         = "git::https://github.com/kalidindi-naveen/Learn-TF-Modules//10.Terraform-AWS-SG?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "ansible"
  vpc_id         = data.aws_ssm_parameter.this.value
  sg_description = "SG For ansible"
  ingress        = var.ingress
  common_tags    = var.common_tags
}