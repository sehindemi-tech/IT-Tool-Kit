resource "aws_ecs_cluster" "this" {
  name = var.ecs_cluster.name

  setting {
    name  = var.ecs_cluster.setting.name
    value = var.ecs_cluster.setting.value
  }
}

