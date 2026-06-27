terraform {
  required_version = "1.15.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.52.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      Project     = var.project_settings.Project
      Environment = var.project_settings.Environment
      Managed_By  = var.project_settings.Iac_managed
    }
  }
}
