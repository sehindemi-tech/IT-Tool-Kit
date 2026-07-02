resource "aws_ecs_task_definition" "this" {
  family                   = var.ecs_task_definition.family
  cpu                      = var.ecs_task_definition.cpu
  memory                   = var.ecs_task_definition.memory
  execution_role_arn       = aws_iam_role.this["task_execution"].arn
  task_role_arn            = aws_iam_role.this["task_role"].arn
  network_mode             = var.ecs_task_definition.network_mode
  requires_compatibilities = var.ecs_task_definition.requires_compatibilities

  runtime_platform {
    operating_system_family = var.ecs_task_definition.runtime_platform.operating_system_family
    cpu_architecture        = var.ecs_task_definition.runtime_platform.cpu_architecture
  }
  container_definitions = jsonencode([
    {
      name                   = var.ecs_task_definition.container_definition.name
      image                  = var.ecs_task_definition.container_definition.image
      essential              = var.ecs_task_definition.container_definition.essential
      privileged             = var.ecs_task_definition.container_definition.privileged
      user                   = var.ecs_task_definition.container_definition.user
      readonlyRootFilesystem = var.ecs_task_definition.container_definition.readonly_root_filesystem

      portMappings = [
        {
          containerPort = var.ecs_task_definition.container_definition.port_mappings.container_port
          protocol      = var.ecs_task_definition.container_definition.port_mappings.protocol
        }
      ]

      healthCheck = {
        command     = var.ecs_task_definition.container_definition.health_check.command
        interval    = var.ecs_task_definition.container_definition.health_check.interval
        retries     = var.ecs_task_definition.container_definition.health_check.retries
        startPeriod = var.ecs_task_definition.container_definition.health_check.start_period
        timeout     = var.ecs_task_definition.container_definition.health_check.timeout
      }

      logConfiguration = {
        logDriver = var.ecs_task_definition.container_definition.log_configuration.log_driver
        options = {
          awslogs-region        = "eu-west-2"
          awslogs-group         = aws_cloudwatch_log_group.this.name
          awslogs-stream-prefix = var.ecs_task_definition.container_definition.log_configuration.options.awslogs_stream_prefix
        }
      }
    }
  ])
}
