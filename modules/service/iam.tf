data "aws_iam_policy_document" "ecs_service" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_service" {
  name                 = "${var.name}-ecs-service-role"
  assume_role_policy   = data.aws_iam_policy_document.ecs_service.json
  permissions_boundary = var.permissions_boundary == "" ? null : var.permissions_boundary
  tags                 = var.tags
}

data "aws_iam_policy_document" "ecs_service_policy" {
  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "elasticloadbalancing:Describe*",
      "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
      "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
      "ec2:Describe*",
      "ec2:AuthorizeSecurityGroupIngress",
      "elasticloadbalancing:RegisterTargets",
      "elasticloadbalancing:DeregisterTargets"
    ]
  }
}

resource "aws_iam_role_policy" "ecs_service" {
  name   = "${var.name}-ecs-service-policy"
  policy = data.aws_iam_policy_document.ecs_service_policy.json
  role   = aws_iam_role.ecs_service.id
}
