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
  access_key = "AKIA2EFS3QBOIR7JVZBI"
  secret_key = "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"
}

module "terraform_aws_ecs" {
  source="../../"
  ecs_name= var.ecs_name
}