# Fargate Task Definition Module

Stolen from: [cloudposse](https://github.com/cloudposse/terraform-aws-ecs-container-definition)

## Port mappings

```(terraform)
port_mappings = [
    {
      containerPort = 8080
      hostPort      = 80
      protocol      = "tcp"
    },
    {
      containerPort = 8081
      hostPort      = 443
      protocol      = "udp"
    }
  ]
```

## Environment Variables

### File

```(terraform)
environment_files = [
    {
      value = "arn:aws:s3:::s3_bucket_name/envfile_01.env"
      type  = "s3"
    },
    {
      value = "arn:aws:s3:::s3_bucket_name/another_envfile.env"
      type  = "s3"
    }
  ]
```

### String

```(terraform)
environment = [
    {
      name  = "string_var"
      value = "123"
    },
    {
      name  = "another_string_var"
      value = "true"
    },
    {
      name  = "yet_another_string_var"
      value = "false"
    },
    {
      name  = "false_boolean_var"
      value = false
    },
    {
      name  = "integer_var"
      value = 42
    }
  ]
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| container\_definition\_json | A string containing a JSON-encoded array of container definitions<br>(`"[{ "name": "container1", ... }, { "name": "container2", ... }]"`).<br>See [AWS docs](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html),<br>https://github.com/cloudposse/terraform-aws-ecs-container-definition, or<br>[Terraform docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition#container_definitions) | `string` | n/a | yes |
| name | The name of the task. Up to 255 characters ([a-z], [A-Z], [0-9], -, \_ allowed) | `any` | n/a | yes |
| tags | Map of tags to apply to resources | `map(any)` | n/a | yes |
| network\_mode | (Optional) The Docker networking mode to use for the containers in the task. | `string` | `"awsvpc"` | no |
| task\_capabilities | (Optional) A set of launch types required by the task. The valid values are EC2 and FARGATE | `list(any)` | <pre>[<br>  "FARGATE"<br>]</pre> | no |
| task\_cpu | (Optional) The number of cpu units used by the task. If the requires\_compatibilities is FARGATE this field is required. Task CPU must be greater than sum of container CPU | `number` | `1024` | no |
| task\_exec\_role\_policy\_arns\_default | Default AWS policies assigned to the task execution role | `list` | <pre>[<br>  "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",<br>  "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess",<br>  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",<br>  "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess",<br>  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"<br>]</pre> | no |
| task\_exec\_role\_policy\_arns\_extra | Additional iam policy arns to be added to task exec role | `list` | `[]` | no |
| task\_memory | (Optional) The amount (in MiB) of memory used by the task. If the requires\_compatibilities is FARGATE this field is required. Task memory must be greater than sum of container memory | `number` | `2048` | no |
| task\_role\_policy\_arns\_default | IAM role policy arns to assign to the task | `list` | <pre>[<br>  "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess",<br>  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"<br>]</pre> | no |
| task\_role\_policy\_arns\_extra | IAM role policy arns to assign to the task | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| task\_def\_arn | n/a |
| task\_role\_arn | n/a |

