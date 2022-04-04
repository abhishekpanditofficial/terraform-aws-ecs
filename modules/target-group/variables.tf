variable "target_group_name" {
  type = string
  description = "Name of the target group"
}
variable "target_group_port" {
  type = string
  description = "Port of the target group"
  default = 80
}
variable "target_group_protocol" {
  type = string
  description = "Protocol of the target group"
  default = "TCP"
}
variable "target_group_target_type" {
  type = string
  description = "Target type of the target group"
  default = "alb"
}
variable "vpc_id" {
  type = string
  description = "Vpc id for the target-group"
}
variable "project" {
  type = string
  description = "name of the project"
}
variable "environment" {
  type = string
  description = "environment of the project"
  default = "production"
}
