# Autoscaling

variable "min_capacity" { default = 1 }
variable "max_capacity" { default = 4 }
variable "target_value" { default = 75 }
variable "disable_scale_in" { default = false }
variable "scale_in_cooldown" { default = 60 }
variable "scale_out_cooldown" { default = 60 }
variable "autoscale_predefined_metric" {
  default     = "ECSServiceAverageCPUUtilization"
  description = " ECSServiceAverageCPUUtilization, ALBRequestCountPerTarget, ECSServiceAverageMemoryUtilization"
}

# Service
variable "name" { default = "ecs-service" }
variable "tags" { default = {} }
variable "task_definition_arn" {}
variable "enable_autoscaling" { default = true }
variable "vpc_id" {
  type        = string
  description = "The VPC ID where resources are created"
}

variable "alb_security_group" {
  type        = string
  description = "Security group of the ALB"
  default     = ""
}

variable "ecs_cluster_name" {
  type        = string
  description = "ECS Cluster Name"
}

variable "ecs_cluster_arn" {
  type        = string
  description = "The ARN of the ECS cluster where service will be provisioned"
}

variable "ecs_load_balancers" {
  type = list(object({
    container_name   = string
    container_port   = number
    elb_name         = string
    target_group_arn = string
  }))
  description = "A list of load balancer config objects for the ECS service; see `load_balancer` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html"
  default     = []
}

variable "container_port" {
  type        = number
  description = "The port on the container to allow via the ingress security group"
  default     = 80
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs"
}

variable "security_group_ids" {
  description = "Security group IDs to allow in Service `network_configuration`"
  type        = list(string)
  default     = []
}

variable "launch_type" {
  type        = string
  description = "The launch type on which to run your service. Valid values are `EC2` and `FARGATE`"
  default     = "FARGATE"
}

variable "platform_version" {
  type        = string
  default     = "LATEST"
  description = <<-EOT
    The platform version on which to run your service. Only applicable for launch_type set to FARGATE.
    More information about Fargate platform versions can be found in the AWS ECS User Guide.
    EOT
}

variable "scheduling_strategy" {
  type        = string
  default     = "REPLICA"
  description = <<-EOT
    The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON.
    Note that Fargate tasks do not support the DAEMON scheduling strategy.
    EOT
}

variable "ordered_placement_strategy" {
  type = list(object({
    type  = string
    field = string
  }))
  default     = []
  description = <<-EOT
    Service level strategy rules that are taken into consideration during task placement.
    List from top to bottom in order of precedence. The maximum number of ordered_placement_strategy blocks is 5.
    See `ordered_placement_strategy` [Terraform docs](
    https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service#ordered_placement_strategy)
    EOT
}

variable "service_placement_constraints" {
  type = list(object({
    type       = string
    expression = string
  }))
  description = "The rules that are taken into consideration during task placement. Maximum number of placement_constraints is 10. See `placement_constraints` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#placement_constraints-1"
  default     = []
}

variable "network_mode" {
  type        = string
  description = "The network mode to use for the task. This is required to be `awsvpc` for `FARGATE` `launch_type`"
  default     = "awsvpc"
}

variable "desired_count" {
  type        = number
  description = "The number of instances of the task definition to place and keep running"
  default     = 1
}

variable "deployment_controller_type" {
  type        = string
  description = "Type of deployment controller. Valid values are `CODE_DEPLOY` and `ECS`"
  default     = "ECS"
}

variable "deployment_maximum_percent" {
  type        = number
  description = "The upper limit of the number of tasks (as a percentage of `desired_count`) that can be running in a service during a deployment"
  default     = 200
}

variable "deployment_minimum_healthy_percent" {
  type        = number
  description = "The lower limit (as a percentage of `desired_count`) of the number of tasks that must remain running and healthy in a service during a deployment"
  default     = 100
}

variable "health_check_grace_period_seconds" {
  type        = number
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. Only valid for services configured to use load balancers"
  default     = 300
}




variable "assign_public_ip" {
  type        = bool
  description = "Assign a public IP address to the ENI (Fargate launch type only). Valid values are `true` or `false`. Default `false`"
  default     = false
}

variable "propagate_tags" {
  type        = string
  description = "Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK_DEFINITION"
  default     = "SERVICE"
}

variable "enable_ecs_managed_tags" {
  type        = bool
  description = "Specifies whether to enable Amazon ECS managed tags for the tasks within the service"
  default     = true
}

variable "capacity_provider_strategies" {
  type = list(object({
    capacity_provider = string
    weight            = number
    base              = number
  }))
  description = "The capacity provider strategies to use for the service. See `capacity_provider_strategy` configuration block: https://www.terraform.io/docs/providers/aws/r/ecs_service.html#capacity_provider_strategy"
  default     = []
}

variable "service_registries" {
  type = list(object({
    registry_arn   = string
    port           = number
    container_name = string
    container_port = number
  }))
  description = "The service discovery registries for the service. The maximum number of service_registries blocks is 1. The currently supported service registry is Amazon Route 53 Auto Naming Service - `aws_service_discovery_service`; see `service_registries` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries-1"
  default     = []
}

variable "use_alb_security_group" {
  type        = bool
  description = "A flag to enable/disable adding the ingress rule to the ALB security group"
  default     = false
}

variable "use_nlb_cidr_blocks" {
  type        = bool
  description = "A flag to enable/disable adding the NLB ingress rule to the security group"
  default     = false
}

variable "nlb_cidr_blocks" {
  type        = list(string)
  description = "A list of CIDR blocks to add to the ingress rule for the NLB container port"
  default     = []
}


variable "permissions_boundary" {
  type        = string
  description = "A permissions boundary ARN to apply to the 3 roles that are created."
  default     = ""
}
