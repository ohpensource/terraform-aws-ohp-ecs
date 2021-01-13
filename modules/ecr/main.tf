resource "aws_ecr_repository" "main" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = var.scan_image_on_push
  }
  tags = merge(
    var.tags,
    map(
      "Name", var.name
    )
  )
}

resource "aws_ecr_lifecycle_policy" "main" {
  repository = aws_ecr_repository.main.name

  policy = <<EOF
    ${local.lifecycle_policy}
  EOF
}

resource "aws_ecr_repository_policy" "main" {
  count      = local.create_default_ecr_policy
  repository = aws_ecr_repository.main.name

  policy = local.default_ecr_policy
}
