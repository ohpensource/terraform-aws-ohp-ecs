# Terraform Module - Task Definition

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

## Usage

<!--- BEGIN_TF_DOCS --->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_task_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_role_policies_attach_default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_role_policies_attach_extra](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_task_role_policies_attach_default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_task_role_policies_attach_extra](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_definition_json"></a> [container\_definition\_json](#input\_container\_definition\_json) | A string containing a JSON-encoded array of container definitions<br>(`"[{ "name": "container1", ... }, { "name": "container2", ... }]"`).<br>See [AWS docs](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html),<br>https://github.com/cloudposse/terraform-aws-ecs-container-definition, or<br>[Terraform docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition#container_definitions) | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the task. Up to 255 characters ([a-z], [A-Z], [0-9], -, \_ allowed) | `any` | n/a | yes |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | (Optional) The Docker networking mode to use for the containers in the task. | `string` | `"awsvpc"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) Map of tags to apply to resources | `map(any)` | n/a | yes |
| <a name="input_task_capabilities"></a> [task\_capabilities](#input\_task\_capabilities) | (Optional) A set of launch types required by the task. The valid values are EC2 and FARGATE | `list(any)` | <pre>[<br>  "FARGATE"<br>]</pre> | no |
| <a name="input_task_cpu"></a> [task\_cpu](#input\_task\_cpu) | (Optional) The number of cpu units used by the task. If the requires\_compatibilities is FARGATE this field is required. Task CPU must be greater than sum of container CPU | `number` | `1024` | no |
| <a name="input_task_exec_role_policy_arns_default"></a> [task\_exec\_role\_policy\_arns\_default](#input\_task\_exec\_role\_policy\_arns\_default) | Default AWS policies assigned to the task execution role | `list` | <pre>[<br>  "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",<br>  "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess",<br>  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",<br>  "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess",<br>  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"<br>]</pre> | no |
| <a name="input_task_exec_role_policy_arns_extra"></a> [task\_exec\_role\_policy\_arns\_extra](#input\_task\_exec\_role\_policy\_arns\_extra) | Additional iam policy arns to be added to task exec role | `list` | `[]` | no |
| <a name="input_task_memory"></a> [task\_memory](#input\_task\_memory) | (Optional) The amount (in MiB) of memory used by the task. If the requires\_compatibilities is FARGATE this field is required. Task memory must be greater than sum of container memory | `number` | `2048` | no |
| <a name="input_task_role_policy_arns_default"></a> [task\_role\_policy\_arns\_default](#input\_task\_role\_policy\_arns\_default) | IAM role policy arns to assign to the task | `list` | <pre>[<br>  "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess",<br>  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"<br>]</pre> | no |
| <a name="input_task_role_policy_arns_extra"></a> [task\_role\_policy\_arns\_extra](#input\_task\_role\_policy\_arns\_extra) | IAM role policy arns to assign to the task | `list` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_task_def_arn"></a> [task\_def\_arn](#output\_task\_def\_arn) | n/a |
| <a name="output_task_role_arn"></a> [task\_role\_arn](#output\_task\_role\_arn) | n/a |

<!--- END_TF_DOCS --->
