# module "ecs_cloudwatch_sns_alarms" {
#   source  = "git::https://github.com/cloudposse/terraform-aws-ecs-cloudwatch-sns-alarms.git?ref=tags/0.8.1"
#   enabled = var.ecs_alarms_enabled

#   cluster_name = var.ecs_cluster_name
#   service_name = module.ecs_alb_service_task.service_name

#   cpu_utilization_high_threshold          = var.ecs_alarms_cpu_utilization_high_threshold
#   cpu_utilization_high_evaluation_periods = var.ecs_alarms_cpu_utilization_high_evaluation_periods
#   cpu_utilization_high_period             = var.ecs_alarms_cpu_utilization_high_period

#   cpu_utilization_high_alarm_actions = compact(
#     concat(
#       var.ecs_alarms_cpu_utilization_high_alarm_actions,
#       [local.cpu_utilization_high_alarm_actions],
#     )
#   )

#   cpu_utilization_high_ok_actions = var.ecs_alarms_cpu_utilization_high_ok_actions

#   cpu_utilization_low_threshold          = var.ecs_alarms_cpu_utilization_low_threshold
#   cpu_utilization_low_evaluation_periods = var.ecs_alarms_cpu_utilization_low_evaluation_periods
#   cpu_utilization_low_period             = var.ecs_alarms_cpu_utilization_low_period

#   cpu_utilization_low_alarm_actions = compact(
#     concat(
#       var.ecs_alarms_cpu_utilization_low_alarm_actions,
#       [local.cpu_utilization_low_alarm_actions],
#     )
#   )

#   cpu_utilization_low_ok_actions = var.ecs_alarms_cpu_utilization_low_ok_actions

#   memory_utilization_high_threshold          = var.ecs_alarms_memory_utilization_high_threshold
#   memory_utilization_high_evaluation_periods = var.ecs_alarms_memory_utilization_high_evaluation_periods
#   memory_utilization_high_period             = var.ecs_alarms_memory_utilization_high_period

#   memory_utilization_high_alarm_actions = compact(
#     concat(
#       var.ecs_alarms_memory_utilization_high_alarm_actions,
#       [local.memory_utilization_high_alarm_actions],
#     )
#   )

#   memory_utilization_high_ok_actions = var.ecs_alarms_memory_utilization_high_ok_actions

#   memory_utilization_low_threshold          = var.ecs_alarms_memory_utilization_low_threshold
#   memory_utilization_low_evaluation_periods = var.ecs_alarms_memory_utilization_low_evaluation_periods
#   memory_utilization_low_period             = var.ecs_alarms_memory_utilization_low_period

#   memory_utilization_low_alarm_actions = compact(
#     concat(
#       var.ecs_alarms_memory_utilization_low_alarm_actions,
#       [local.memory_utilization_low_alarm_actions],
#     )
#   )

#   memory_utilization_low_ok_actions = var.ecs_alarms_memory_utilization_low_ok_actions

#   context = module.this.context
# }

# module "alb_target_group_cloudwatch_sns_alarms" {
#   source  = "git::https://github.com/cloudposse/terraform-aws-alb-target-group-cloudwatch-sns-alarms.git?ref=tags/0.12.1"
#   enabled = var.alb_target_group_alarms_enabled

#   alarm_actions                  = var.alb_target_group_alarms_alarm_actions
#   ok_actions                     = var.alb_target_group_alarms_ok_actions
#   insufficient_data_actions      = var.alb_target_group_alarms_insufficient_data_actions
#   alb_arn_suffix                 = var.alb_arn_suffix
#   target_group_arn_suffix        = module.alb_ingress.target_group_arn_suffix
#   target_3xx_count_threshold     = var.alb_target_group_alarms_3xx_threshold
#   target_4xx_count_threshold     = var.alb_target_group_alarms_4xx_threshold
#   target_5xx_count_threshold     = var.alb_target_group_alarms_5xx_threshold
#   target_response_time_threshold = var.alb_target_group_alarms_response_time_threshold
#   period                         = var.alb_target_group_alarms_period
#   evaluation_periods             = var.alb_target_group_alarms_evaluation_periods

#   context = module.this.context
# }
