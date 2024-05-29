data "aws_ssm_parameter" "this" {
  name = "/expense/dev/bastion_sg_id"
}

data "aws_ssm_parameter" "pub_subnet_ids" {
  name = "/expense/dev/pub_subnet_ids"
}

module "bastion-made-easy" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "bastion"
  ami  = data.aws_ami.ami_id.id

  instance_type          = "t3.micro"
  monitoring             = true
  vpc_security_group_ids = [data.aws_ssm_parameter.this.value]
  subnet_id              = element(split(",", data.aws_ssm_parameter.pub_subnet_ids.value), 0)

  tags = {
    Name        = "bastion",
    Project     = "expense",
    Environment = "dev",
    Terraform   = "true"
  }
}