resource "aws_iam_role" "ecr_pull_role" {
  count              = local.create_pull_role
  name               = local.pull_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_pull.*.json[count.index]
}

resource "aws_iam_role" "ecr_push_role" {
  count              = local.create_push_role
  name               = local.push_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_push.*.json[count.index]
}

resource "aws_iam_role_policy_attachment" "ecr_pull_role" {
  count      = var.ecr_pull_role_policy_arn != null ? 1 : 0
  role       = aws_iam_role.ecr_pull_role.*.name[count.index]
  policy_arn = var.ecr_pull_role_policy_arn
}

resource "aws_iam_role_policy_attachment" "ecr_push_role" {
  count      = var.ecr_push_role_policy_arn != null ? 1 : 0
  role       = aws_iam_role.ecr_push_role.*.name[count.index]
  policy_arn = var.ecr_push_role_policy_arn
}
