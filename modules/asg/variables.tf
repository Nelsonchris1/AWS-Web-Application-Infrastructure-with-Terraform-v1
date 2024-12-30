variable "project_name" {
  description = "name of project"
  type        = string
}

variable "instance_type" {
  description = "Instance type for web"
  type        = string
}

variable "security_group_id" {
  description = "security group id"
  type        = string
}

variable "ami_id" {
  description = "ami id"
  type        = string
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "target_group_arn" {
  description = "target group arn"
  type        = list(string)
}

variable "subnet_ids" {
  description = "subnet ids"
  type        = list(string)
}
