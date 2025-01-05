variable "bucket_name" {
  description = "name of bucket"
  type        = string
  default     = "edutech-alb-access-logs"
}

variable "environment" {
  description = "name of environment"
  type        = string
  default     = "PROD"
}