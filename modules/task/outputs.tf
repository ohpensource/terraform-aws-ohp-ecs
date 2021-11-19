output "task_def_arn" {
  value = aws_ecs_task_definition.main.arn
}

output "task_role_arn" {
  value = aws_iam_role.ecs_task_role.arn
}
