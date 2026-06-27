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
      project     = var.project_settings.project
      Envrionment = var.project_settings.Envrionment
      Manged_By   = var.project_settings.iac_managed
    }
  }
}
