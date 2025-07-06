#SG-1
resource "aws_security_group" "dynamic_sg1" {
  name        = "dynamic-sg1"
  description = "1st Security group with dynamic ingress"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg1_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dynamic-sg1"
  }
}

#SG-2
resource "aws_security_group" "dynamic_sg2" {
  name        = "dynamic-sg2"
  description = "2nd Security group with dynamic ingress"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg2_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dynamic-sg2"
  }
}