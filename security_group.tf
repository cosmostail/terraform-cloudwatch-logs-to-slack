resource "aws_security_group" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.name}-sg"
  }
}

resource "aws_security_group_rule" "egress" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.this.id
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "egress"
}

