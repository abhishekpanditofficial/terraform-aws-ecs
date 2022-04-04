resource "aws_kms_key" "kms" {
  description             = var.kms_key_description
  deletion_window_in_days = var.kms_key_deletion

  tags = {
    project = var.project
    environment= var.environment
  }
}

resource "aws_cloudwatch_log_group" "log" {
  name = var.cloud_watch_log_group_name

    tags = {
    project = var.project
    environment= var.environment
  }
}
resource "aws_cloudwatch_log_stream" "log_stream" {
  name           = "${var.project}-log-stream"
  log_group_name = aws_cloudwatch_log_group.log.name
}

resource "aws_ecs_cluster" "cluster" {
  name = var.ecs_name

    tags = {
    project = var.project
    environment= var.environment
  }

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.kms.arn
      logging    = var.logging

      log_configuration {
        cloud_watch_encryption_enabled = var.cloud_watch_encryption_enabled
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.log.name
      }
    }
  }
}
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.ecs_task_execution_role_name}-ecsTaskRole"
 
  assume_role_policy = "${file("${path.module}/role-policy.json")}"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "${var.project}-task-${var.environment}"

  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = var.network_mode
  requires_compatibilities = [var.launch_type]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = jsonencode([{
   name        = "${var.name}-container-${var.environment}"
   image       = "${var.container_image}:latest"
   essential   = true
   environment = var.container_environment
   portMappings = [{
     protocol      = var.protocol
     containerPort = var.app_port
     hostPort      = var.app_port
   }]
  }])
}

resource "aws_ecs_service" "main" {
  name            = "${var.project}-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.app_count
  launch_type     = var.launch_type
  network_configuration {
    security_groups  = [var.security_group_id]
    subnets          = var.vpc_private_subnet_id
    assign_public_ip = var.assign_public_ip
  }

  load_balancer {
    target_group_arn = var.target_group_id
    container_name   = "${var.project}-app"
    container_port   = var.app_port
  }

  depends_on = [var.alb_listener_frontend, aws_iam_role.ecs_task_execution_role]
}