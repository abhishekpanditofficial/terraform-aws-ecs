variable "group_name" {
  type = string
  description = "name of the security group"
}

variable "group_description" {
  type = string
  description = "description of the group"
}
variable "vpc_id" {
  type = string
  description = "id of the vpc"
}
variable "cidr_block" {
  type = string
  description = "cidr block of the vpc"
}
variable "ipv6_cidr_block" {
  type = string
  description = "1pv6 cidr block of the vpc"
}

variable "tls_ingress_description" {
  type = string
  description = "description of the tls ingress security group"
  default = "Security group tcp from vpc"
}
variable "tls_ingress_from" {
  type = number
  description = "from port of the tls ingress security group"
  default = 443
}
variable "tls_ingress_to" {
  type = number
  description = "to of the tls ingress security group"
  default = 443
}
variable "tls_ingress_protocol" {
  type = string
  description = "protocol of the tls ingress security group"
  default = "tcp"
}
variable "tls_egress_from" {
  type = number
  description = "from port of the tls egress security group"
  default = 0
}
variable "tls_egress_to" {
  type = number
  description = "to of the tls egress security group"
  default = 0
}
variable "tls_egress_protocol" {
  type = string
  description = "protocol of the tls egress security group"
  default = "-1"
}
variable "tls_egress_cidr" {
  type = string
  description = "cidr block of the tls egress security group"
  default = "0.0.0.0/0"
}
variable "tls_egress_ipv6_cidr" {
  type = string
  description = "ipv6 cidr block of the tls egress security group"
  default = "::/0"
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