# This instructs Terragrunt to create the file provider.tf
# in the working directory (where Terragrunt calls terraform)
# before it calls any of the Terraform commands (e.g plan,
# apply, validate, etc). This allows you to inject this provider
# configuration in all the modules that includes the root file.

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    provider "aws" {
      profile = "default"
      region  = "eu-west-1"
    }
  EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    profile        = "default"
    bucket         = "localhost-terragrunt"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
