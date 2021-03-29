# Pull User
resource "aws_iam_access_key" "pull" {
  count = local.create_pull_user
  user  = aws_iam_user.pull.*.name[count.index]
}

resource "aws_iam_user" "pull" {
  count = local.create_pull_user
  name  = local.pull_iam_user_name
  tags = merge(
    var.tags,
    map(
      "Name", local.pull_iam_user_name
    )
  )
}

resource "aws_iam_user_policy" "pull" {
  count = local.create_pull_user
  name  = "${local.pull_iam_user_name}-ecr-policy"
  user  = aws_iam_user.pull.*.name[count.index]

  policy = data.aws_iam_policy_document.ecr_pull_user_policy.*.json[count.index]
}

resource "aws_secretsmanager_secret" "pull" {
  count = local.create_pull_user
  name  = local.pull_iam_user_name
  tags = merge(
    var.tags,
    map(
      "Name", local.pull_iam_user_name
    )
  )
}

resource "aws_secretsmanager_secret_version" "pull" {
  count         = local.create_pull_user
  secret_id     = aws_secretsmanager_secret.pull.*.id[count.index]
  secret_string = "{\"AccessKey\":\"${aws_iam_access_key.pull.*.id[count.index]}\",\"SecretKey\":\"${aws_iam_access_key.pull.*.secret[count.index]}\"}"
}


