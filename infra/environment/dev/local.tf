locals {
  vpc = {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
    vpc_name             = "IT-Tools-App"
  }
  subnets = {
    Public-Subnet-A = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "eu-west-2a"
      is_public         = true
    }

    Public-Subnet-B = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "eu-west-2b"
      is_public         = true
    }

    Private-Subnet-A = {
      cidr_block        = "10.0.3.0/24"
      availability_zone = "eu-west-2a"
      is_public         = false
    }

    Private-Subnet-B = {
      cidr_block        = "10.0.4.0/24"
      availability_zone = "eu-west-2b"
      is_public         = false
    }
  }
  project_name = "IT-Tools-App"
}