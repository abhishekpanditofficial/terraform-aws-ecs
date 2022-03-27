resource "aws_kms_key" "kms" {
  description             = "kms key"
  deletion_window_in_days = 7
}

resource "aws_cloudwatch_log_group" "log" {
  name = "cloudwatch-log-group"
}

resource "aws_ecs_cluster" "cluster" {
  name = var.ecs_name

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.kms.arn
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.log.name
      }
    }
  }
}