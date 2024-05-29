module "be-made-easy" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-be"
  ami  = data.aws_ami.ami_id.id

  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [data.aws_ssm_parameter.be_sg_id.value]
  subnet_id              = element(split(",", data.aws_ssm_parameter.pri_subnet_ids.value), 0)

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-be"
  })
}

module "fe-made-easy" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-fe"
  ami  = data.aws_ami.ami_id.id

  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [data.aws_ssm_parameter.fe_sg_id.value]
  subnet_id              = element(split(",", data.aws_ssm_parameter.pub_subnet_ids.value), 0)

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-fe"
  })
}