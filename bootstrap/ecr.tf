resource "aws_ecr_repository" "this" {
  name                 = "${var.project_settings.org}-${var.ecr_repo.name}"
  image_tag_mutability = var.ecr_repo.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.ecr_repo.scan_on_push
  }

  encryption_configuration {
    encryption_type = var.ecr_repo.encryption_type
  }
}
