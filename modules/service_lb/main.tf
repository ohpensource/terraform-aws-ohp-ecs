module "service" {
  source  = "cloudposse/ecs-alb-service-task/aws"
  version = "0.42.3"

  alb_security_group                = var.alb_security_group
  use_alb_security_group            = var.use_alb_security_group
  nlb_cidr_blocks                   = var.nlb_cidr_blocks
  use_nlb_cidr_blocks               = var.use_nlb_cidr_blocks
  container_definition_json         = local.all_container_definitions
  desired_count                     = var.desired_count
  health_check_grace_period_seconds = var.health_check_grace_period_seconds
  task_cpu                          = coalesce(var.task_cpu, var.container_cpu)
  task_memory                       = coalesce(var.task_memory, var.container_memory)
  ignore_changes_task_definition    = var.ignore_changes_task_definition
  ecs_cluster_arn                   = var.ecs_cluster_arn
  capacity_provider_strategies      = var.capacity_provider_strategies
  service_registries                = var.service_registries
  launch_type                       = var.launch_type
  platform_version                  = var.platform_version
  vpc_id                            = var.vpc_id
  assign_public_ip                  = var.assign_public_ip
  security_group_ids                = var.ecs_security_group_ids
  subnet_ids                        = var.ecs_private_subnet_ids
  container_port                    = var.container_port
  nlb_container_port                = var.nlb_container_port
  volumes                           = var.volumes
  ecs_load_balancers                = local.load_balancers
  deployment_controller_type        = var.deployment_controller_type

  context = module.this.context
}
