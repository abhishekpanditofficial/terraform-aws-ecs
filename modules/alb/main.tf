resource "aws_lb" "alb" {
  name               = var.lb_name
  internal           = var.alb_internal
  load_balancer_type = var.lb_type
  security_groups    = [var.security_group_id]
  subnets            = [var.public_subnet_id,var.private_subnet_id]

  

  # access_logs {
  #   bucket  = var.s3_bucket_bucket
  #   prefix  = "test-lb"
  #   enabled = true
  # }

  tags = {
    environment = var.environment
    project= var.project
  }
}

# Redirect all traffic from the ALB to the target group
resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTP"

  default_action {
    target_group_arn = var.target_group_id
    type             = "forward"
  }
}