terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

// VPC
module "vpc" {
  source="./modules/vpc"
  project= var.project
}
// SECURITY-GROUP
module "security_group" {
  source="./modules/security-group"
  group_name= var.security_group_name
  group_description= var.security_group_description
  vpc_id= module.vpc.vpc_id
  cidr_block= module.vpc.vpc_cidr_block
  ipv6_cidr_block= module.vpc.vpc_ipv6_cidr_block
  project= var.project
}
//TARGET-GROUP
module "target_group" {
  source="./modules/target-group"
  vpc_id= module.vpc.vpc_id
  target_group_name= var.target_group_name
  project=var.project
}

// S3-LOGS
module "alb_s3_logs" {
  source="./modules/s3"
  project= var.project
  bucket_name= var.alb_logs_bucket
  s3_acl= var.alb_logs_bucket_acl
}
// resource creation: bucket-logging for alb logging
resource "aws_s3_bucket_logging" "alb_logging" {
  bucket = module.alb_s3_logs.bucket_id

  target_bucket = module.alb_s3_logs.bucket_id
  target_prefix = "log/"
}

// ALB
module "alb" {
  source="./modules/alb"
  lb_name= var.lb_name
  security_group_id= module.security_group.security_group_id
  target_group_id= module.target_group.target_group_id
  public_subnet_id= module.vpc.public_subnet_id
  private_subnet_id= module.vpc.private_subnet_id
  s3_bucket_bucket= module.alb_s3_logs.s3_bucket_bucket
  project= var.project

}

//ecs
module "ecs" {
  source="./modules/ecs"
  ecs_name= var.ecs_name
  cloud_watch_log_group_name= var.ecs_cloud_watch_log_group_name
  project= var.project
  security_group_id= module.security_group.security_group_id
  target_group_id= module.target_group.target_group_id
  vpc_private_subnet_id= module.vpc.private_subnet_id
  alb_listener_frontend= module.alb.alb_listener_frontend
}
//autoscaling
module "autoscaling" {
  source= "./modules/auto-scaling"
  cluster_name= module.ecs.ecs_cluster_name
  ecs_service_name= module.ecs.ecs_service_name
}