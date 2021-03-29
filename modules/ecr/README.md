# XOPS Terraform module for AWS Elastic Container Repositories

## Usage

Module allows for a wide variety of use cases particularly around IAM and ECR policy permissions however it is recommended to use the generic IAM user in the core-shared account to pull/push images to the repository.

The module can be used directly from your own Terraform project to create ECRs in core-shared account. It is no longer necessary to deploy ECRs via the shd-services Cloudformation templates. An additional provider must be configured in your project:

``` (terraform)

variable "account_id_core_shared" { default = "086282490297" }

provider "aws" {
  alias                   = "core_shared"
  region                  = "eu-west-1"
  allowed_account_ids     = [var.account_id_core_shared]
}

module "ecr" {
  source = "git@bitbucket.org:ohpen-dev/terraform-aws-ns-ecs.git?ref=v0.2.1"

  providers = {
    aws = aws.core_shared
  }
  ........
}

```

NB: ref=v0.2.1 refers to the version tag of the module. It can be removed to always pull latest (not recommended). Version shown in code above is not necessarily the latest version available.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_ecr_lifecycle_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) |
| [aws_ecr_repository](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) |
| [aws_ecr_repository_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) |
| [aws_iam_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) |
| [aws_iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) |
| [aws_iam_user_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) |
| [aws_secretsmanager_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) |
| [aws_secretsmanager_secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | EC Repository Name | `any` | n/a | yes |
| create\_ecr\_policy | n/a | `bool` | `false` | no |
| create\_iam\_role\_pull | n/a | `bool` | `false` | no |
| create\_iam\_role\_push | n/a | `bool` | `false` | no |
| create\_iam\_user\_pull | n/a | `bool` | `false` | no |
| create\_iam\_user\_push | n/a | `bool` | `false` | no |
| custom\_ecr\_policy | Json formatted ECR policy - overrides any default policy | `any` | `null` | no |
| default\_ecr\_policy\_type | pull or push | `any` | `null` | no |
| ecr\_policy\_principal\_type | List of principals allowed to use the ECR policy | `string` | `"AWS"` | no |
| ecr\_policy\_principals | List of principals allowed to use the ECR policy | `list` | <pre>[<br>  "*"<br>]</pre> | no |
| ecr\_pull\_role\_policy\_arn | Arn of ECR policy to attach to pull role | `string` | `null` | no |
| ecr\_pull\_role\_principal\_type | n/a | `string` | `"*"` | no |
| ecr\_pull\_role\_principals | n/a | `list(any)` | <pre>[<br>  "*"<br>]</pre> | no |
| ecr\_push\_role\_policy\_arn | Arn of ECR policy to attach to push role | `string` | `null` | no |
| ecr\_push\_role\_principal\_type | n/a | `string` | `"*"` | no |
| ecr\_push\_role\_principals | n/a | `list(any)` | <pre>[<br>  "*"<br>]</pre> | no |
| expire\_untagged\_image\_days | Expire untagged images older than X days | `number` | `30` | no |
| image\_tag\_mutability | Image tag immutablity MUTABLE/IMMUTABLE | `string` | `"MUTABLE"` | no |
| keep\_last\_x\_tagged\_images | Keep last X tagged images | `number` | `10` | no |
| lifecycle\_policy | ECR lifecycle policy (jsonencoded) | `any` | `null` | no |
| pull\_iam\_role\_name | ECR Pull Role name - leave blank for default name based on var.name | `any` | `null` | no |
| pull\_iam\_user\_name | ECR Pull User name - leave blank for default name based on var.name | `any` | `null` | no |
| push\_iam\_role\_name | ECR Push Role name - leave blank for default name based on var.name | `any` | `null` | no |
| push\_iam\_user\_name | ECR Push User name - leave blank for default name based on var.name | `any` | `null` | no |
| scan\_image\_on\_push | Scan image for vulnerabilities on push | `bool` | `false` | no |
| tag\_prefix\_list | List of tag prefixes | `list` | <pre>[<br>  "v"<br>]</pre> | no |
| tags | Map of tags to apply to repository | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Full ARN of the repository |
| id | The registry ID where the repository was created |
| url | The URL of the repository |
