resource "aws_iam_role" "ecr_pull_role" {
  name               = "${var.name}-ecr-pull-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_pull.json
}

resource "aws_iam_role" "ecr_push_role" {
  name               = "${var.name}-ecr-push-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_push.json
}
