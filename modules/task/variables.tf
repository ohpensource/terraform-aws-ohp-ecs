variable "name" {
  description = "The name of the task. Up to 255 characters ([a-z], [A-Z], [0-9], -, _ allowed)"
}
variable "tags" {
  type        = map(any)
  description = "Map of tags to apply to resources"
}

# IAM Variables
variable "task_role_policy_arns_default" {
  description = "IAM role policy arns to assign to the task"
  default = [
    "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  ]
}

variable "task_role_policy_arns_extra" {
  description = "IAM role policy arns to assign to the task"
  default     = []
}

variable "task_exec_role_policy_arns_default" {
  description = "Default AWS policies assigned to the task execution role"
  default = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
    "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]
}

variable "task_exec_role_policy_arns_extra" {
  description = "Additional iam policy arns to be added to task exec role"
  default     = []
}


# Task Variables
variable "network_mode" {
  default = "awsvpc"
}

variable "task_cpu" {
  default     = 1024
  description = "Task CPU must be greater than sum of container CPU"
}

variable "task_memory" {
  default     = 2048
  description = "Task memory must be greater than sum of container memory"
}

variable "task_capabilities" {
  default = ["FARGATE"]
}

variable "container_definition_json" {
  type        = string
  description = <<-EOT
    A string containing a JSON-encoded array of container definitions
    (`"[{ "name": "container1", ... }, { "name": "container2", ... }]"`).
    See [AWS docs](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html),
    https://github.com/cloudposse/terraform-aws-ecs-container-definition, or
    [Terraform docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition#container_definitions)
    EOT
}
