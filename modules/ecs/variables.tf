variable "ecs_name" {
  description = "name of the image for ecs"
  type = string
}

variable "cloud_watch_log_group_name" {
  description = "name of the cloudwatch log group"
  type = string
}
variable "project" {
  description = "name of the project"
  type = string
}
variable "environment" {
  description = "environment of the project"
  type = string
  default = "production"
}
variable "kms_key_description" {
  description = "description of the kms key"
  type = string
  default = "kms key for the cloudwatch log group of ecs"
}
variable "kms_key_deletion" {
  description = "deletion window for the kms key"
  type = number
  default = 7
}
variable "logging" {
  description = "logging config"
  type = string
  default = "OVERRIDE"
}

variable "cloud_watch_encryption_enabled" {
  description = "cloudwatch encryption configuration"
  type = bool
  default = true
}

variable "security_group_id" {
  description = "id of the security group"
  type = string
}
variable "vpc_private_subnet_id" {
  description = "id of the vpc private subnet"
  type = string
}
variable "target_group_id" {
  description = "id of the target group"
  type = string
}
variable "alb_listener_frontend" {
  description = "alb listener"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "myEcsTaskExecutionRole"
}

variable "ecs_auto_scale_role_name" {
  description = "ECS auto scale role Name"
  default = "myEcsAutoScaleRole"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "bradfordhamilton/crystal_blockchain:latest"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 3000
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 3
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

variable "protocol" {
  type = string
  description = "Which protocol to use"
  default = "tcp"
}

variable "assign_public_ip" {
  type = bool
  description = "To assign public ip to container or not"
  default = false
}

variable "launch_type" {
  type=string
  description = " Which launch type you want to use0"
  default = "FARGATE"  
}

variable "network_mode" {
  type = string
  description = "which network mode to use (Ex: awsvpc)?"
  default = "awsvpc"
}

