variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "devops-seed"
}

variable "domain_name" {
  description = "Nombre de dominio"
  type        = string
  default     = "projects-zahid.com"
}
