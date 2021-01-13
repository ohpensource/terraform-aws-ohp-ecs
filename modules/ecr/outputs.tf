output "arn" {
  value       = aws_ecr_repository.main.arn
  description = "Full ARN of the repository"
}

output "id" {
  value       = aws_ecr_repository.main.registry_id
  description = "The registry ID where the repository was created"
}

output "url" {
  value       = aws_ecr_repository.main.repository_url
  description = "The URL of the repository"
}

