output "vpc_id" {
  description = "ID of the default VPC"
  value       = data.aws_vpc.defualt.id
}

output "subnet_ids" {
  description = "IDs of the default subnets"
  value       = tolist(data.aws_subnets.default.ids)
}