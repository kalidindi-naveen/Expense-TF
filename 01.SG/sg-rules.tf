resource "aws_security_group_rule" "db-be" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.sg-made-easy-be.sg_id
  security_group_id        = module.sg-made-easy-db.sg_id
}