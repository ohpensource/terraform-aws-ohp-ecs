resource "aws_cloudwatch_log_group" "app" {
  count = var.cloudwatch_log_group_enabled ? 1 : 0

  name              = var.cloudwatch_log_group_name
  tags              = var.tags
  retention_in_days = var.log_retention_in_days
}

variable "cloudwatch_log_group_enabled" { default = true }
variable "cloudwatch_log_group_name" { default = "" }
variable "log_retention_in_days" { default = 3 }
