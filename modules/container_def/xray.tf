module "xray_container_definition" {
  count   = var.enable_xray ? 1 : 0
  source  = "cloudposse/ecs-container-definition/aws"
  version = "0.45.0"

  container_name    = "xray-daemon"
  container_image   = var.xray_container_image
  ulimits           = var.ulimits
  log_configuration = local.log_config_aws_logs
}

