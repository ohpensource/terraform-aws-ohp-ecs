






data "aws_iam_policy_document" "ecs_task" {
  count = local.enabled && length(var.task_role_arn) == 0 ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task" {
  count = local.enabled && length(var.task_role_arn) == 0 ? 1 : 0

  name                 = "${var.task_name}-ecs-task-role"
  assume_role_policy   = join("", data.aws_iam_policy_document.ecs_task.*.json)
  permissions_boundary = var.permissions_boundary == "" ? null : var.permissions_boundary
  tags                 = var.tags
}

resource "aws_iam_role_policy_attachment" "ecs_task" {
  count      = local.enabled && length(var.task_role_arn) == 0 ? length(var.task_policy_arns) : 0
  policy_arn = var.task_policy_arns[count.index]
  role       = join("", aws_iam_role.ecs_task.*.id)
}


data "aws_iam_policy_document" "ecs_service" {
  count = local.enabled ? 1 : 0

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
  count                = local.enable_ecs_service_role ? 1 : 0
  name                 = "${var.service_name}-ecs-service-role"
  assume_role_policy   = join("", data.aws_iam_policy_document.ecs_service.*.json)
  permissions_boundary = var.permissions_boundary == "" ? null : var.permissions_boundary
  tags                 = tags.tags
}

data "aws_iam_policy_document" "ecs_service_policy" {
  count = local.enable_ecs_service_role ? 1 : 0

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
  count  = local.enable_ecs_service_role ? 1 : 0
  name   = "${var.service_name}-ecs-service-policy"
  policy = join("", data.aws_iam_policy_document.ecs_service_policy.*.json)
  role   = join("", aws_iam_role.ecs_service.*.id)
}

# IAM role that the Amazon ECS container agent and the Docker daemon can assume
data "aws_iam_policy_document" "ecs_task_exec" {
  count = local.enabled && length(var.task_exec_role_arn) == 0 ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_exec" {
  count                = local.enabled && length(var.task_exec_role_arn) == 0 ? 1 : 0
  name                 = "${var.task_name}-ecs-task-exec-role"
  assume_role_policy   = join("", data.aws_iam_policy_document.ecs_task_exec.*.json)
  permissions_boundary = var.permissions_boundary == "" ? null : var.permissions_boundary
  tags                 = var.tags
}

data "aws_iam_policy_document" "ecs_exec" {
  count = local.enabled && length(var.task_exec_role_arn) == 0 ? 1 : 0

  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ssm:GetParameters",
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
  }
}

resource "aws_iam_role_policy" "ecs_exec" {
  count  = local.enabled && length(var.task_exec_role_arn) == 0 ? 1 : 0
  name   = "${var.task_name}-ecs-task-exec-policy"
  policy = join("", data.aws_iam_policy_document.ecs_exec.*.json)
  role   = join("", aws_iam_role.ecs_exec.*.id)
}

resource "aws_iam_role_policy_attachment" "ecs_exec" {
  count      = local.enabled && length(var.task_exec_role_arn) == 0 ? length(var.task_exec_policy_arns) : 0
  policy_arn = var.task_exec_policy_arns[count.index]
  role       = join("", aws_iam_role.ecs_exec.*.id)
}
