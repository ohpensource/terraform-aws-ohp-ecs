## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs\_cluster\_arn | The ARN of the ECS cluster where service will be provisioned | `string` | n/a | yes |
| ecs\_cluster\_name | ECS Cluster Name | `string` | n/a | yes |
| subnet\_ids | Subnet IDs | `list(string)` | n/a | yes |
| tags | (Optional) Key-value map of resource tags | `map(any)` | n/a | yes |
| task\_definition\_arn | (Required) The family and revision (family:revision) or full ARN of the task definition that you want to run in your service. Required unless using the EXTERNAL deployment controller. If a revision is not specified, the latest ACTIVE revision is used | `string` | n/a | yes |
| vpc\_id | The VPC ID where resources are created | `string` | n/a | yes |
| alb\_security\_group | Security group of the ALB | `string` | `""` | no |
| assign\_public\_ip | Assign a public IP address to the ENI (Fargate launch type only). Valid values are `true` or `false`. Default `false` | `bool` | `false` | no |
| autoscale\_predefined\_metric | (Optional) Autoscaling - A predefined metric - ECSServiceAverageCPUUtilization, ALBRequestCountPerTarget, ECSServiceAverageMemoryUtilization | `string` | `"ECSServiceAverageCPUUtilization"` | no |
| capacity\_provider\_strategies | The capacity provider strategies to use for the service. See `capacity_provider_strategy` configuration block: https://www.terraform.io/docs/providers/aws/r/ecs_service.html#capacity_provider_strategy | <pre>list(object({<br>    capacity_provider = string<br>    weight            = number<br>    base              = number<br>  }))</pre> | `[]` | no |
| container\_port | The port on the container to allow via the ingress security group | `number` | `80` | no |
| deployment\_controller\_type | Type of deployment controller. Valid values are `CODE_DEPLOY` and `ECS` | `string` | `"ECS"` | no |
| deployment\_maximum\_percent | The upper limit of the number of tasks (as a percentage of `desired_count`) that can be running in a service during a deployment | `number` | `200` | no |
| deployment\_minimum\_healthy\_percent | The lower limit (as a percentage of `desired_count`) of the number of tasks that must remain running and healthy in a service during a deployment | `number` | `100` | no |
| desired\_count | The number of instances of the task definition to place and keep running. Ignored when autoscaling enabled | `number` | `1` | no |
| disable\_scale\_in | (Optional) Autoscaling - Indicates whether scale in by the target tracking policy is disabled. If the value is true, scale in is disabled and the target tracking policy won't remove capacity from the scalable resource. Otherwise, scale in is enabled and the target tracking policy can remove capacity from the scalable resource | `bool` | `false` | no |
| ecs\_load\_balancers | A list of load balancer config objects for the ECS service; see `load_balancer` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html | <pre>list(object({<br>    container_name   = string<br>    container_port   = number<br>    elb_name         = string<br>    target_group_arn = string<br>  }))</pre> | `[]` | no |
| enable\_autoscaling | (Optional) Enable autoscaling | `bool` | `true` | no |
| enable\_ecs\_managed\_tags | Specifies whether to enable Amazon ECS managed tags for the tasks within the service | `bool` | `true` | no |
| health\_check\_grace\_period\_seconds | Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. Only valid for services configured to use load balancers | `number` | `300` | no |
| launch\_type | The launch type on which to run your service. Valid values are `EC2` and `FARGATE` | `string` | `"FARGATE"` | no |
| max\_capacity | (Required) Autoscaling - The max capacity of the scalable target | `number` | `4` | no |
| min\_capacity | (Required) Autoscaling - The min capacity of the scalable target | `number` | `1` | no |
| name | (Required) The name of the service | `string` | `"ecs-service"` | no |
| network\_mode | The network mode to use for the task. This is required to be `awsvpc` for `FARGATE` `launch_type` | `string` | `"awsvpc"` | no |
| nlb\_cidr\_blocks | A list of CIDR blocks to add to the ingress rule for the NLB container port | `list(string)` | `[]` | no |
| ordered\_placement\_strategy | Service level strategy rules that are taken into consideration during task placement.<br>List from top to bottom in order of precedence. The maximum number of ordered\_placement\_strategy blocks is 5.<br>See `ordered_placement_strategy` [Terraform docs](<br>https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service#ordered_placement_strategy) | <pre>list(object({<br>    type  = string<br>    field = string<br>  }))</pre> | `[]` | no |
| permissions\_boundary | A permissions boundary ARN to apply to the 3 roles that are created. | `string` | `""` | no |
| platform\_version | The platform version on which to run your service. Only applicable for launch\_type set to FARGATE.<br>More information about Fargate platform versions can be found in the AWS ECS User Guide. | `string` | `"LATEST"` | no |
| propagate\_tags | Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK\_DEFINITION | `string` | `"SERVICE"` | no |
| scale\_in\_cooldown | (Optional) Autoscaling - The amount of time, in seconds, after a scale in activity completes before another scale in activity can start | `number` | `60` | no |
| scale\_out\_cooldown | (Optional) Autoscaling - The amount of time, in seconds, after a scale out activity completes before another scale out activity can start | `number` | `60` | no |
| scheduling\_strategy | The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON.<br>Note that Fargate tasks do not support the DAEMON scheduling strategy. | `string` | `"REPLICA"` | no |
| security\_group\_ids | Security group IDs to allow in Service `network_configuration` | `list(string)` | `[]` | no |
| service\_placement\_constraints | The rules that are taken into consideration during task placement. Maximum number of placement\_constraints is 10. See `placement_constraints` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#placement_constraints-1 | <pre>list(object({<br>    type       = string<br>    expression = string<br>  }))</pre> | `[]` | no |
| service\_registries | The service discovery registries for the service. The maximum number of service\_registries blocks is 1. The currently supported service registry is Amazon Route 53 Auto Naming Service - `aws_service_discovery_service`; see `service_registries` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries-1 | <pre>list(object({<br>    registry_arn   = string<br>    port           = number<br>    container_name = string<br>    container_port = number<br>  }))</pre> | `[]` | no |
| target\_value | (Required) Autoscaling policy - The target value for the metric | `number` | `75` | no |
| use\_alb\_security\_group | A flag to enable/disable adding the ingress rule to the ALB security group | `bool` | `false` | no |
| use\_nlb\_cidr\_blocks | A flag to enable/disable adding the NLB ingress rule to the security group | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| sg\_id | n/a |

