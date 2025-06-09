terraform {
  cloud {
    organization = "Zahiduck" # este es el nombre de la org que te crea terraform cloud

    workspaces {
      name = "iac-aws-infrastructure" # este es el nombre exacto que diste al workspace
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}