locals {
  scalable_dimension = var.scalable_dimension
  resource_id = "service/${var.cluster_name}/${var.ecs_service_name}"
  service_namespace = var.service_namespace

}

resource "aws_appautoscaling_target" "target" {
  service_namespace  = local.service_namespace
  resource_id        = local.resource_id
  scalable_dimension = local.scalable_dimension
  role_arn           = aws_iam_role.ecs_auto_scale_role.arn
  min_capacity       = var.autoscaling_min_capacity
  max_capacity       = var.autoscaling_max_capacity
}

# Automatically scale capacity up by one
resource "aws_appautoscaling_policy" "up" {
  name               = "${var.project}-service-up"
  service_namespace  = local.service_namespace
  resource_id        = local.resource_id
  scalable_dimension = local.scalable_dimension

  step_scaling_policy_configuration {
    adjustment_type         = var.adjustment_for_autoscaling
    cooldown                = var.auto_scaling_cooldown
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }

  depends_on = [aws_appautoscaling_target.target]
}

# Automatically scale capacity down by one
resource "aws_appautoscaling_policy" "down" {
  name               = "${var.project}-service-up"
  service_namespace  = local.service_namespace
  resource_id        = local.resource_id
  scalable_dimension = local.scalable_dimension

  step_scaling_policy_configuration {
    adjustment_type         = var.adjustment_for_autoscaling
    cooldown                = var.auto_scaling_cooldown
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = -1
    }
  }

  depends_on = [aws_appautoscaling_target.target]
}

# CloudWatch alarm that triggers the autoscaling up policy
resource "aws_cloudwatch_metric_alarm" "service_cpu_high" {
  alarm_name          = "${var.project}-service-utilization-high"
  comparison_operator = var.high_comparison_operator
  evaluation_periods  = var.auto_scaling_evaluation_periods
  metric_name         = var.auto_scaling_metric_name
  namespace           = var.auto_scaling_service_namespace
  period              = var.auto_scaling_check_period
  statistic           = var.auto_scaling_statistic
  threshold           = var.auto_scaling_high_threshold

  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.ecs_service_name
  }

  alarm_actions = [aws_appautoscaling_policy.up.arn]
}

# CloudWatch alarm that triggers the autoscaling down policy
resource "aws_cloudwatch_metric_alarm" "service_cpu_low" {
  alarm_name          = "${var.project}-service-utilization-low"
  comparison_operator = var.low_comparison_operator
  evaluation_periods  = var.auto_scaling_evaluation_periods
  metric_name         = var.auto_scaling_metric_name
  namespace           = var.auto_scaling_service_namespace
  period              = var.auto_scaling_check_period
  statistic           = var.auto_scaling_statistic
  threshold           = var.auto_scaling_low_threshold

  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.ecs_service_name
  }

  alarm_actions = [aws_appautoscaling_policy.down.arn]
}