variable "cluster_name" {
  type = string
  description = "name of the ecs cluster"
}
variable "ecs_service_name" {
  type = string
  description = "name of the ecs service"
}

variable "scalable_dimension" {
  type = string
  description = "which scalable dimension to use (Ex:ecs:service:DesiredCount for ecs)?"
  default = "ecs:service:DesiredCount"
}

variable "service_namespace" {
  type = string
  description = "which service namespace to use (Ex: ecs)?"
  default = "ecs"
}

variable "high_comparison_operator" {
  type = string
  description = "operator to use for high utilization comparison (Ex: GreaterThanOrEqualToThreshold)"
  default = "GreaterThanOrEqualToThreshold"
}

variable "low_comparison_operator" {
  type = string
  description = "operator to use for low utilization comparison (Ex: LessThanOrEqualToThreshold)"
  default = "LessThanOrEqualToThreshold"
}


variable "auto_scaling_metric_name" {
  description = "which metric to check for autoscaling? (Ex:CPUUtilization)"
  default = "CPUUtilization"
}

variable "auto_scaling_evaluation_periods" {
  type = number
  description = "The number of periods over which data is compared to the specified threshold."
  default = 2
}


variable "auto_scaling_low_threshold" {
  type = string
  description = "Low threshold value for autoscaling"
  default = "10"
}

variable "auto_scaling_high_threshold" {
  type = string
  description = "High threshold value for autoscaling"
  default = "85"
}
variable "auto_scaling_service_namespace" {
  type = string
  description = "Service namespace for autoscaling"
  default = "AWS/ECS"
}

variable "auto_scaling_check_period" {
  type = string
  description = "Check period for autoscaling"
  default = "60"
}

variable "auto_scaling_statistic" {
  type = string
  description = "Statistic Method to check for autoscaling"
  default = "Average"
}


variable "adjustment_for_autoscaling" {
  type = string
  description = "Adjustment type required for autoscaling"
  default = "ChangeInCapacity"
}

variable "auto_scaling_cooldown" {
  type = number
  description = "Cooldown required for autoscaling"
  default = 60
}

variable "autoscaling_max_capacity" {
  type = number
  description = "Cooldown required for autoscaling"
  default = 60
}

variable "autoscaling_min_capacity" {
  type = number
  description = "Cooldown required for autoscaling"
  default = 60
}