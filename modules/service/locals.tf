locals {
  health_check_grace_period_seconds = var.ecs_load_balancers != [] ? var.health_check_grace_period_seconds : null
}
