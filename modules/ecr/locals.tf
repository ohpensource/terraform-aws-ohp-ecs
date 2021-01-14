locals {
  create_push_user = var.push_iam_user_name != "" ? 1 : 0
  create_pull_user = var.pull_iam_user_name != "" ? 1 : 0

  create_default_ecr_policy = var.ecr_policy_type != "" ? 1 : 0
  default_ecr_policy        = var.ecr_policy_type == "push" ? local.ecr_push_pull_policy : local.ecr_pull_policy
  lifecycle_policy          = var.lifecycle_policy != "" ? var.lifecycle_policy : local.default_lifecycle_policy

  tag_prefix_list       = jsonencode(var.tag_prefix_list)
  ecr_policy_principals = jsonencode(var.ecr_policy_principals)

  default_lifecycle_policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than ${var.expire_untagged_image_days} days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": ${var.expire_untagged_image_days}
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 2,
            "description": "Keep last ${var.keep_last_x_tagged_images} images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ${local.tag_prefix_list},
                "countType": "imageCountMoreThan",
                "countNumber": ${var.keep_last_x_tagged_images}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF

  ecr_push_pull_policy = data.aws_iam_policy_document.ecr_policy_push.json

  ecr_pull_policy = data.aws_iam_policy_document.ecr_policy_pull.json

}
