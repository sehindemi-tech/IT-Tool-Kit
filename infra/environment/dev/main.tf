module "networking" {
  source             = "../../modules/networking"
  vpc                = local.vpc
  subnets            = local.subnets
  project_name       = local.project_name
  vpc_endpoints_sg   = local.security_group.vpc_endpoints_sg
  gateway_endpoint   = local.gateway_endpoint
  interface_endpoint = local.interface_endpoint
  cloud_watch        = local.cloud_watch
}

module "dns" {
  source    = "../../modules/dns"
  dns       = local.dns
  dns_alias = local.dns_alias
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
  alb                    = local.alb
  alb_target_group       = local.alb_target_group
  alb_listener           = local.alb_listener
}

module "ecs" {
  source                       = "../../modules/ecs"
  ecs_cloudwatch               = local.ecs_cloudwatch
  ecs_iam_roles                = local.ecs_iam_roles
  ecs_security_group           = local.ecs_security_group
  ecs_cluster                  = local.ecs_cluster
  ecs_task_definition          = local.ecs_task_definition
  ecs_service                  = local.ecs_service
  ecs_app_auto_scalling_target = local.ecs_app_auto_scalling_target
  app_autoscaling_policy       = local.app_autoscaling_policy
  sns_topic_name               = local.sns_topic_name
  sns_topic_subscription_email = local.sns_topic_subscription_email
  cloudwatch_alarms            = local.cloudwatch_alarms

}