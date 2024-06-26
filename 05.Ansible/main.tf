data "aws_ssm_parameter" "this" {
  name = "/${var.project_name}/${var.environment}/ansible_sg_id"
}

data "aws_ssm_parameter" "pub_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/pub_subnet_ids"
}

module "ansible-made-easy" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-ansible"
  ami  = data.aws_ami.ami_id.id

  instance_type               = "t2.micro"
  monitoring                  = true
  user_data                   = file("ansible.sh")
  associate_public_ip_address = true
  vpc_security_group_ids      = [data.aws_ssm_parameter.this.value]
  subnet_id                   = element(split(",", data.aws_ssm_parameter.pub_subnet_ids.value), 0)

  tags = {
    Name        = "${var.project_name}-${var.environment}-ansible",
    Project     = "expense",
    Environment = "dev",
    Terraform   = "true"
  }
}