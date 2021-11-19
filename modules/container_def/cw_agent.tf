module "cwagent_container_definition" {
  count   = var.enable_cw_agent ? 1 : 0
  source  = "cloudposse/ecs-container-definition/aws"
  version = "0.45.0"

  container_name    = "cloudwatch-agent"
  container_image   = var.cw_agent_container_image
  ulimits           = var.ulimits
  log_configuration = local.log_config_aws_logs
  secrets           = [{ name = "CW_CONFIG_CONTENT", valueFrom = aws_ssm_parameter.cw_agent[count.index].name }]
}

resource "aws_ssm_parameter" "cw_agent" {
  count = var.enable_cw_agent ? 1 : 0
  name  = "/${var.name}/ecs-cwagent"
  type  = "String"
  value = "{\"logs\": {\"metrics_collected\": {\"emf\": {}}}}"
  tags  = var.tags
}

