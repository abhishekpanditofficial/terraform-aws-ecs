variable "project" {
  type= string
  description = "project name for the vpc"
}
variable "security_group_name" {
  type = string
  description = "name of the security group"
}

variable "security_group_description" {
  type = string
  description = "description of the security group"
}
variable "target_group_name" {
  type = string
  description = "Name of the target group"
}
variable "alb_logs_bucket" {
    type = string
    description = "Bucket name for S3"
}
variable "alb_logs_bucket_acl" {
    type = string
    description = "Acl for the S3"
}
variable "lb_name" {
    type = string
    description = "name for the lb"
}
variable "ecr_image_name" {
  description = "name of the image for ecr"
  type = string
}
variable "ecs_name" {
  description = "name of the image for ecs"
  type = string
}

variable "ecs_cloud_watch_log_group_name" {
  description = "name of the cloudwatch log group for ecs"
  type = string
}