terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# VPC module
module "vpc" {
  source = "./modules/vpc"
}

# Security Group module
module "security-groups" {
  project_name = var.project_name
  source       = "./modules/security-groups"
  vpc_id       = module.vpc.vpc_id
}

# EC2 Instances module
module "ec2" {
  source            = "./modules/ec2"
  security_group_id = module.security-groups.web_sg_id
  key_name          = var.key_name
  project_name      = var.project_name
}

# Application load balancer module
module "alb" {
  source            = "./modules/alb"
  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.security-groups.web_sg_id
  instance_ids      = module.ec2.instance_ids
  domain_name       = var.domain_name
}