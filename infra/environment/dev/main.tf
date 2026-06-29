module "networking" {
  source             = "../../modules/networking"
  vpc                = local.vpc
  subnets            = local.subnets
  project_name       = local.project_name
  vpc_endpoints_sg   = local.security_group.vpc_endpoints_sg
  interface_endpoint = local.interface_endpoint
  cloud_watch        = local.cloud_watch
}

module "dns" {
  source = "../../modules/dns"
  dns    = local.dns
}

module "acm" {
  source       = "../../modules/acm"
  acm_settings = local.acm_settings
}

module "alb" {
  source                 = "../../modules/alb"
  alb_sg                 = local.alb_sg
  project_name           = local.project_name
  alb_access_logs_bucket = local.alb_access_logs_bucket


}