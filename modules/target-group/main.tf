resource "aws_lb_target_group" "group" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  target_type =  var.target_group_target_type
  vpc_id   = var.vpc_id

  tags = {
    project = var.project
    environment= var.environment
  }
}
