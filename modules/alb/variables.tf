variable "project_name" {
  description = "Name of the project, used for resource naming"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "security group ID for the ALB"
  type        = string
}

# variable "instance_ids" {
#   description = "List of instance IDs"
#   type        = list(string)
# }

variable "domain_name" {
  description = "Domain name for the ALB"
  type        = string
}
