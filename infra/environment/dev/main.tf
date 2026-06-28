module "networking" {
  source       = "../../modules/networking"
  vpc          = local.vpc
  subnets      = local.subnets
  project_name = local.project_name


}