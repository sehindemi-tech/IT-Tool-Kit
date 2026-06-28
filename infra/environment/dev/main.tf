module "networking" {
  source             = "../../modules/networking"
  vpc                = local.vpc
  subnets            = local.subnets
  project_name       = local.project_name
  vpc_endpoints_sg   = local.security_group.vpc_endpoints_sg
  interface_endpoint = local.interface_endpoint
  cloud_watch        = local.cloud_watch
}