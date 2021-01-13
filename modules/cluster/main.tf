resource "aws_ecs_cluster" "main" {
  name = var.name

  # capacity_providers = []
  # default_capacity_provider_strategy = {
  #   capacity_provider = var.capacity_provider
  #   weight = var.capacity_provider_weight
  #   base = var.capacity_provider_base
  # }

  setting {
    name  = "containerInsights"
    value = local.enable_container_insights
  }

  tags = merge(var.tags, map("Name", var.name))
}

