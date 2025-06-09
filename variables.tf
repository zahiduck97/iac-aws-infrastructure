
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

variable "alb_name" {
  default = "devops-seed-alb"
}

variable "alb_target_group_name" {
  default = "devops-seed-tg"
}

variable "domain_name" {
  type        = string
  description = "Nombre de dominio principal"
  default     = "projects-zahid.com"
}
