module "ecs_cloudwatch_autoscaling" {
  source  = "cloudposse/ecs-cloudwatch-autoscaling/aws"
  version = "0.5.0"

  enabled               = var.autoscaling_enabled
  name                  = var.name
  service_name          = var.service_name
  cluster_name          = var.ecs_cluster_name
  min_capacity          = var.autoscaling_min_capacity
  max_capacity          = var.autoscaling_max_capacity
  scale_down_adjustment = var.autoscaling_scale_down_adjustment
  scale_down_cooldown   = var.autoscaling_scale_down_cooldown
  scale_up_adjustment   = var.autoscaling_scale_up_adjustment
  scale_up_cooldown     = var.autoscaling_scale_up_cooldown
}


