variable "project_name" {
  description = "Name of project"
  type        = string
}


variable "vpc_id" {
  description = "ID of the VPC where security groups will be created"
  type        = string
}

variable "db_port" {
  description = "Port number of the database"
  type        = number
  default     = 3306
}