variable "lb_name" {
    type = string
    description = "name for the lb"
}
variable "lb_type" {
    type = string
    description = "type of the lb"
    default = "application"
}
variable "security_group_id" {
    type = string
    description = "id of the security group"
}
variable "target_group_id" {
    type = string
    description = "id of the alb target group"
}
variable "public_subnet_id" {
    type = string
    description = "ids of the public subnet"
}
variable "private_subnet_id" {
    type = string
    description = "ids of the public subnet"
}

variable "s3_bucket_bucket" {
    type = string
    description = "logs bucket"
}
variable "project" {
    type = string
    description = "name for the project"
}
variable "environment" {
    type = string
    description = "Environment for the ALB"
    default = "production"
}
variable "alb_internal" {
    type = bool
    description = "internal enabled"
    default = false
}