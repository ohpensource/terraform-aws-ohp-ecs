locals {
  container_image        = "${var.container_image}:${var.container_image_version}"
  app_container_def      = module.container_definition.json_map_encoded
  xray_container_def     = var.enable_xray ? module.xray_container_definition[0].json_map_encoded : ""
  cw_agent_container_def = var.enable_cw_agent ? module.cwagent_container_definition[0].json_map_encoded : ""


  container_defs = (
    var.enable_xray && var.enable_cw_agent ? "[${local.app_container_def}, ${local.xray_container_def}, ${local.cw_agent_container_def}]" :
    var.enable_xray && !var.enable_cw_agent ? "[${local.app_container_def}, ${local.xray_container_def}]" :
    !var.enable_xray && var.enable_cw_agent ? "[${local.app_container_def}, ${local.cw_agent_container_def}]" : "[${local.app_container_def}]"
  )

  log_config_aws_logs = var.log_configuration == null ? {
    logDriver = "awslogs"
    options = {
      awslogs-group         = var.cloudwatch_log_group_name
      awslogs-region        = data.aws_region.current.name
      awslogs-stream-prefix = "task"
    }
    secretOptions = []
  } : var.log_configuration

}
