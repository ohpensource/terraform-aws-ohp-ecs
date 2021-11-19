# Terraform Module - ECS Clusters

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
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights) | Enable Cloudwatch Container Insights | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | ECS Cluster Name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) Map of tags to apply to cluster | `map(any)` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ECS Cluster Id/Arn |
| <a name="output_id"></a> [id](#output\_id) | ECS Cluster Id/Arn |
| <a name="output_name"></a> [name](#output\_name) | ECS Cluster Name |

<!--- END_TF_DOCS --->
