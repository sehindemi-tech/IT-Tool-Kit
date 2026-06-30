locals {
  project_name = "IT-Tools-App"

  #Networking module
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


  ### Dns Module
  dns = {
    zone_name = "it-tools.sehindemi.com"
  }

  ### Acm Module
  acm_settings = {
    domain_name = module.dns.zone_name
    zone_id     = module.dns.zone_id
  }

  ### Aplication Load Balancer Module
  alb_sg = {
    name        = "IT Tools ALB SG"
    description = "IT Tools ALB SG"
    vpc_id      = module.networking.vpc_id
    ingress_rule = {
      http = {
        from_port   = 80
        to_port     = 80
        ip_protocol = "tcp"
        cidr_ipv4   = "0.0.0.0/0"
      }
      https = {
        from_port   = 443
        to_port     = 443
        ip_protocol = "tcp"
        cidr_ipv4   = "0.0.0.0/0"
      }
    }
    egress_rule = {
      https = {
        from_port   = 8080
        to_port     = 8080
        ip_protocol = "tcp"
        cidr_ipv4   = module.networking.vpc_cidr
      }
    }
  }

  alb_access_logs_bucket = {
    bucket_name = "sehindemi-it-tools-alb-access-logs"
    rule = {
      id     = "expire-logs"
      status = "Enabled"
      expiration = {
        days = 7
      }
    }
  }

  alb = {
    name                       = "it-tools-alb"
    enable_deletion_protection = false
    security_groups            = [module.networking.endpoint_security_group_id]
    public_subnets             = module.networking.public_subnets_id
    ip_address_type            = "ipv4"
    access_logs = {
      enabled = true
    }
  }

  alb_target_group = {
    name                              = "it-tools-tg"
    port                              = 8080
    protocol                          = "HTTP"
    target_type                       = "ip"
    vpc_id                            = module.networking.vpc_id
    load_balancing_cross_zone_enabled = true
    ip_address_type                   = "ipv4"

    health_check = {
      enabled             = true
      path                = "/health"
      port                = "traffic-port"
      protocol            = "HTTP"
      matcher             = "200"
      interval            = 30
      timeout             = 5
      healthy_threshold   = 2
      unhealthy_threshold = 3
    }
  }
  alb_listener = {
    http = {
      port     = 80
      protocol = "HTTP"
    }

    https = {
      port            = 443
      protocol        = "HTTPS"
      ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-Res-PQ-2025-09"
      certificate_arn = module.acm.certificate_arn
    }
  }

  ####ECS Module
  ecs_cloudwatch = {
    skip_destroy                = false
    deletion_protection_enabled = false
    name                        = "/ecs/it-tools"
    log_group_class             = "STANDARD"
    retention_in_days           = 7
  }

  ecs_iam_roles = {
    task_execution = {
      name        = "${local.project_name}-ecs-task-execution"
      description = "ECS task execution role"
      policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
    }
    task_role = {
      name        = "${local.project_name}-ecs-task-role"
      description = "ECS application task role"
      policy_arns = []
    }
  }

  ecs_security_group = {
    name        = "${local.project_name}-ecs-sg"
    description = "ECS security group"
    vpc_id      = module.networking.vpc_id
    ingress_rule = {
      from_port   = 8080
      to_port     = 8080
      ip_protocol = "tcp"
      cidr_ipv4   = module.networking.vpc_cidr
    }
    egress_rule = {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      cidr_ipv4   = module.networking.vpc_cidr
    }
  }
}