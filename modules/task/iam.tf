# Task Execution Role
resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "${var.name}-ecs-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags               = var.tags
}


resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policies_attach_default" {
  count      = length(var.task_exec_role_policy_arns_default)
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = var.task_exec_role_policy_arns_default[count.index]
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policies_attach_extra" {
  count      = length(var.task_exec_role_policy_arns_extra)
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = var.task_exec_role_policy_arns_extra[count.index]
}

# Task Role
resource "aws_iam_role" "ecs_task_role" {
  name               = "${var.name}-ecs-task-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_policies_attach_default" {
  count      = length(var.task_role_policy_arns_default)
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = var.task_role_policy_arns_default[count.index]
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_policies_attach_extra" {
  count      = length(var.task_role_policy_arns_extra)
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = var.task_role_policy_arns_extra[count.index]
}



# resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy_attach" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }

# resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_xray_policy_attachment" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
# }

# resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_cw_policy_attachment" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
# }

# resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_ssm_policy_attachment" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
# }

# resource "aws_iam_role_policy_attachment" "ecs_task_ecr_policy_attach" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
# }

