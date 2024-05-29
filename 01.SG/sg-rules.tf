resource "aws_security_group_rule" "db-be" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.sg-made-easy-be.sg_id
  security_group_id        = module.sg-made-easy-db.sg_id
}

resource "aws_security_group_rule" "be-fe" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.sg-made-easy-fe.sg_id
  security_group_id        = module.sg-made-easy-be.sg_id
}

resource "aws_security_group_rule" "fe" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.sg-made-easy-fe.sg_id
}