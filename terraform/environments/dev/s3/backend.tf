terraform {
  backend "s3" {
    profile        = "default"
    bucket         = "localhost-terraform"
    key            = "terraform/environments/dev/s3/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
