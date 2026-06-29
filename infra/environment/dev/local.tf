locals {
  project_name = "IT-Tools-App"
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
  security_group = {
    vpc_endpoints_sg = {
      name        = "${var.project_settings.Project}-vpc-endpoint-sg"
      description = "vpc-endpoint-sg"
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
    }
  }
  interface_endpoint = {
    ecr_api = {
      service_name    = "com.amazonaws.eu-west-2.ecr.api"
      ip_address_type = "ipv4"
    }

    ecr_dkr = {
      service_name    = "com.amazonaws.eu-west-2.ecr.dkr"
      ip_address_type = "ipv4"
    }

    cloudwatch_logs = {
      service_name    = "com.amazonaws.eu-west-2.logs"
      ip_address_type = "ipv4"
    }
  }
  cloud_watch = {
    name              = "/vpc/flow-logs"
    log_group_class   = "STANDARD"
    retention_in_days = 7
  }
  dns = {
    zone_name = "it-tools.sehindemi.com"
  }
  acm_settings = {
    domain_name = module.dns.zone_name
    zone_id     = module.dns.zone_id
  }
}