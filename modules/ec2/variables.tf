variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

variable "security_group_id" {
  description = "Security group ID to attach to the instances"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair to use"
  type        = string
}

variable "ami_id" {
  description = "AMI id for ubuntu"
  type        = string
}