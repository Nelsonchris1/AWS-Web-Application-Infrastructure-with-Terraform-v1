output "vpc_id" {
  description = "ID of the default VPC"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "IDs of the subnets"
  value       = module.vpc.subnet_ids
}

output "ec2_instance_ids" {
  description = "IDs of the EC2 instances"
  value       = module.ec2.instance_ids
}

output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = module.alb.alb_dns_name
}
