resource "aws_ecr_repository" "main" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability

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
  policy     = local.lifecycle_policy
}

resource "aws_ecr_repository_policy" "main" {
  count      = local.create_ecr_policy
  repository = aws_ecr_repository.main.name

  policy = local.ecr_policy
}
