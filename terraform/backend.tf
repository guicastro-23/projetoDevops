terraform {
  backend "s3" {
    bucket  = "terraform-state-guicastro"
    key     = "projetodevops/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

