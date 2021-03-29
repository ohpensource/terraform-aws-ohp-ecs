locals {
  create_push_user = var.create_iam_user_push ? 1 : 0
  create_pull_user = var.create_iam_user_pull ? 1 : 0
  create_push_role = var.create_iam_role_push ? 1 : 0
  create_pull_role = var.create_iam_role_pull ? 1 : 0

  ecr_push_pull_policy = data.aws_iam_policy_document.ecr_policy_push.json
  ecr_pull_policy      = data.aws_iam_policy_document.ecr_policy_pull.json

  pull_iam_user_name = var.pull_iam_user_name == null ? "${var.name}-ecr-pull-user" : var.pull_iam_user_name
  push_iam_user_name = var.push_iam_user_name == null ? "${var.name}-ecr-push-user" : var.push_iam_user_name
  pull_iam_role_name = var.pull_iam_role_name == null ? "${var.name}-ecr-pull-role" : var.pull_iam_role_name
  push_iam_role_name = var.push_iam_role_name == null ? "${var.name}-ecr-push-role" : var.push_iam_role_name

  create_ecr_policy  = var.create_ecr_policy ? 1 : 0
  default_ecr_policy = var.default_ecr_policy_type == "push" ? local.ecr_push_pull_policy : local.ecr_pull_policy
  ecr_policy         = var.custom_ecr_policy == null ? local.default_ecr_policy : var.custom_ecr_policy
  lifecycle_policy   = var.lifecycle_policy != null ? var.lifecycle_policy : local.default_lifecycle_policy

  tag_prefix_list       = jsonencode(var.tag_prefix_list)
  ecr_policy_principals = jsonencode(var.ecr_policy_principals)

  default_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Expire images older than ${var.expire_untagged_image_days} days"
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = var.expire_untagged_image_days
        }
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2
        description  = "Keep last ${var.keep_last_x_tagged_images} images",
        selection = {
          tagStatus     = "tagged"
          countType     = "sinceImagePushed"
          tagPrefixList = local.tag_prefix_list
          countNumber   = var.keep_last_x_tagged_images
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}
