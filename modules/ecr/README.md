# XOPS Terraform module for AWS Elastic Container Repositories

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecr\_name | EC Repository Name | `any` | n/a | yes |
| expire\_untagged\_image\_days | Expire untagged images older than X days | `number` | `30` | no |
| image\_tag\_mutability | Image tag immutablity MUTABLE/IMMUTABLE | `string` | `"MUTABLE"` | no |
| keep\_last\_x\_tagged\_images | Keep last X tagged images | `number` | `10` | no |
| scan\_image\_on\_push | Scan image for vulnerabilities on push | `bool` | `false` | no |
| tag\_list\_prefix | List of tag prefixes | `list` | `["v"]` | no |
| tags | Map of tags to apply to repository | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Full ARN of the repository |
| id | The registry ID where the repository was created |
| url | The URL of the repository |

