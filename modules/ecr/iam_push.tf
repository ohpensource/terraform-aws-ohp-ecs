# Push User
resource "aws_iam_access_key" "push" {
  count = local.create_push_user
  user  = aws_iam_user.push.*.name[count.index]
}

resource "aws_iam_user" "push" {
  count = local.create_push_user
  name  = var.push_iam_user_name
  tags = merge(
    var.tags,
    map(
      "Name", var.push_iam_user_name
    )
  )
}

resource "aws_iam_user_policy" "push" {
  count = local.create_push_user
  name  = "${var.push_iam_user_name}-ecr-policy"
  user  = aws_iam_user.push.*.name[count.index]

  policy = data.aws_iam_policy_document.ecr_push_user_policy.json
}

resource "aws_secretsmanager_secret" "push" {
  count = local.create_push_user
  name  = var.push_iam_user_name
  tags = merge(
    var.tags,
    map(
      "Name", var.push_iam_user_name
    )
  )
}



resource "aws_secretsmanager_secret_version" "push" {
  count         = local.create_push_user
  secret_id     = aws_secretsmanager_secret.push.*.id[count.index]
  secret_string = "{\"AccessKey\":\"${aws_iam_access_key.push.*.id[count.index]}\",\"SecretKey\":\"${aws_iam_access_key.push.*.secret[count.index]}\"}"
}


