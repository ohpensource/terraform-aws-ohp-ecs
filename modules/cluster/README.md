# XOPS Terraform module for AWS ECS Clusters

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ecs\_cluster\_name | ECS Cluster Name | `any` | n/a | yes |
| enable\_container\_insights | Enable Cloudwatch Container Insights | `bool` | `false` | no |
| tags | Map of tags to apply to cluster | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | ECS Cluster Id/Arn |

