# ECR Policies
data "aws_iam_policy_document" "ecr_policy_push" {
  statement {
    sid = "1"

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:GetRepositoryPolicy",
      "ecr:ListImages",
      "ecr:DeleteRepository",
      "ecr:BatchDeleteImage",
      "ecr:SetRepositoryPolicy",
      "ecr:DeleteRepositoryPolicy",
    ]

    principals {
      type        = var.ecr_policy_principal_type
      identifiers = var.ecr_policy_principals
    }
  }
}

data "aws_iam_policy_document" "ecr_policy_pull" {
  statement {
    sid = "1"

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
    ]

    principals {
      type        = var.ecr_policy_principal_type
      identifiers = var.ecr_policy_principals
    }
  }
}

data "aws_iam_policy_document" "ecr_policy_auth" {
  statement {
    sid = "1"

    actions = [
      "ecr:GetAuthorizationToken",
    ]

    resources = ["*"]

    principals {
      type        = var.ecr_policy_principal_type
      identifiers = var.ecr_policy_principals
    }
  }
}

# IAM User policies

data "aws_iam_policy_document" "ecr_pull_user_policy" {
  count = local.create_pull_user
  statement {
    sid = "1"
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage"
    ]
    effect    = "Allow"
    resources = [aws_ecr_repository.main.arn]
  }
  statement {
    sid = "2"
    actions = [
      "ecr:GetAuthorizationToken"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "ecr_push_user_policy" {
  count = local.create_push_user
  statement {
    sid = "1"
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:BatchGetImage",
      "ecr:GetLifecyclePolicy",
      "ecr:GetLifecyclePolicyPreview",
      "ecr:ListTagsForResource",
      "ecr:DescribeImageScanFindings",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:PutImage"
    ]
    effect    = "Allow"
    resources = [aws_ecr_repository.main.arn]
  }
  statement {
    sid = "2"
    actions = [
      "ecr:GetAuthorizationToken"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

# IAM Roles

data "aws_iam_policy_document" "assume_role_policy_pull" {
  count = local.create_pull_role
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = var.ecr_pull_role_principal_type
      identifiers = var.ecr_pull_role_principals
    }
  }
}

data "aws_iam_policy_document" "assume_role_policy_push" {
  count = local.create_push_role
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = var.ecr_push_role_principal_type
      identifiers = var.ecr_push_role_principals
    }
  }
}

