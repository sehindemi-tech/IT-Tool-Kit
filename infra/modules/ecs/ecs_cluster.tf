resource "aws_ecs_cluster" "foo" {
  name = var.ecs_cluster.name

  setting {
    name  = var.ecs_cluster.setting.name
    value = var.ecs_cluster.setting.value
  }
}

