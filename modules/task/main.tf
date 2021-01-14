resource "aws_ecs_task_definition" "main" {
  family                = var.name
  task_role_arn         = aws_iam_role.ecs_task_role.arn
  execution_role_arn    = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = var.container_definition_json

  network_mode             = var.network_mode
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  requires_compatibilities = var.task_capabilities

  tags = var.tags
}


