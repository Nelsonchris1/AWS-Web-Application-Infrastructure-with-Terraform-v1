variable "project_name" {
  description = "Name of project"
  type        = string
  default     = "Edutech"
}

variable "key_name" {
  description = "Name of key pair"
  type        = string
  default     = "vprofile-prod-key"
}

variable "region" {
  description = "project region"
  type        = string
  default     = "eu-west-2"
}

variable "domain_name" {
  description = "website domain name"
  type        = string
  default     = "*.deyplay.xyz"
}

