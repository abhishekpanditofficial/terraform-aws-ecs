resource "aws_security_group" "group" {
  name        = var.group_name
  description = var.group_description
  vpc_id      = var.vpc_id

  ingress {
    description      = var.tls_ingress_description
    from_port        = var.tls_ingress_from
    to_port          = var.tls_ingress_to
    protocol         = var.tls_ingress_protocol
    cidr_blocks      = [var.cidr_block]
    ipv6_cidr_blocks = [var.ipv6_cidr_block]
  }

  egress {
    from_port        = var.tls_egress_from
    to_port          = var.tls_egress_to
    protocol         = var.tls_egress_protocol
    cidr_blocks      = [var.tls_egress_cidr]
    ipv6_cidr_blocks = [var.tls_egress_ipv6_cidr]
  }

  tags = {
    project = var.project
    environment= var.environment
  }
}

# Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "ecs_tasks" {
  name        = "${var.project}-ecs-tasks-security-group"
  description = "allow inbound access from the ALB only"
  vpc_id      = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 3000
    to_port         = 3000
    security_groups = [aws_security_group.group.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}