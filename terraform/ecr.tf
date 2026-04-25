resource "aws_ecr_repository" "ecr_next" {
  name                 = "projeto_prod"
  image_tag_mutability = "MUTABLE"

}

