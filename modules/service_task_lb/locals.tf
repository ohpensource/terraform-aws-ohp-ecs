# locals {
#   alb = {
#     container_name   = coalesce(var.alb_container_name, module.this.id)
#     container_port   = var.container_port
#     elb_name         = null
#     target_group_arn = module.alb_ingress.target_group_arn
#   }
#   nlb = {
#     container_name   = coalesce(var.nlb_container_name, module.this.id)
#     container_port   = var.nlb_container_port
#     elb_name         = null
#     target_group_arn = var.nlb_ingress_target_group_arn
#   }
#   load_balancers = var.nlb_ingress_target_group_arn != "" ? [local.alb, local.nlb] : [local.alb]
#   init_container_definitions = [
#     for init_container in var.init_containers : lookup(init_container, "container_definition")
#   ]

#   container_depends_on = [
#     for init_container in var.init_containers :
#     {
#       containerName = lookup(jsondecode(init_container.container_definition), "name"),
#       condition     = init_container.condition
#     }
#   ]

#   # override container_definition if var.container_definition is supplied
#   main_container_definition = coalesce(var.container_definition, module.container_definition.json_map_encoded)
#   # combine all container definitions
#   all_container_definitions = "[${join(",", concat(local.init_container_definitions, [local.main_container_definition]))}]"
# }

locals {
  cpu_utilization_high_alarm_actions    = var.autoscaling_enabled && var.autoscaling_dimension == "cpu" ? module.ecs_cloudwatch_autoscaling.scale_up_policy_arn : ""
  cpu_utilization_low_alarm_actions     = var.autoscaling_enabled && var.autoscaling_dimension == "cpu" ? module.ecs_cloudwatch_autoscaling.scale_down_policy_arn : ""
  memory_utilization_high_alarm_actions = var.autoscaling_enabled && var.autoscaling_dimension == "memory" ? module.ecs_cloudwatch_autoscaling.scale_up_policy_arn : ""
  memory_utilization_low_alarm_actions  = var.autoscaling_enabled && var.autoscaling_dimension == "memory" ? module.ecs_cloudwatch_autoscaling.scale_down_policy_arn : ""
}


# IAM  - var.ecs_load_balancers sou
locals {
  enabled                 = true
  enable_ecs_service_role = local.enabled && var.network_mode != "awsvpc" && var.enable_ecs_load_balancers
}

