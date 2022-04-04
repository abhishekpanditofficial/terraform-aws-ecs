variable "private_subnets" {
  type = string
  description = "private subnet for the vpc"
  default = "10.0.0.192/26"
}

variable "public_subnets" {
  type = string
  description = "private subnet for the vpc"
  default = "10.0.0.128/26"
}
variable "aws_vpc_cidr" {
  type = string
  description = "CIDR block for the vpc"
  default = "10.0.0.0/16"
}
variable "aws_vpc_instance_tenancy" {
  type = string
  description = "instance tenancy for the vpc"
  default = "default"
}
variable "project" {
  type= string
  description = "project name for the vpc"
}
variable "environment" {
  type= string
  description = "environment for the vpc"
  default = "production"
}
variable "elastic_ip_vpc_enabled" {
  type= bool
  description = "elastic ip enabled"
  default = true
}
variable "aws_route_table_cidr" {
  type = string
  description = "CIDR block for the route table"
  default = "0.0.0.0/0"
}
