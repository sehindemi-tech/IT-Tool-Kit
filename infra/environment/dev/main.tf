module "networking" {
  source = "../../modules/networking"
  vpc    = local.vpc
}