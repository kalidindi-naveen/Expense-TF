data "aws_ssm_parameter" "this" {
  name = "/expense/dev/vpc_id"
}

resource "aws_ssm_parameter" "this" {
  name  = "/${var.project_name}/${var.environment}/${var.sg_name}/sg_id"
  type  = "String"
  value = module.sg-made-easy.id
}

module "sg-made-easy" {
  source         = "git::https://github.com/kalidindi-naveen/Learn-TF-Modules//10.Terraform-AWS-SG?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = var.sg_name
  vpc_id         = data.aws_ssm_parameter.this.value
  sg_description = var.sg_description
  ingress        = var.ingress
  common_tags    = var.common_tags
}