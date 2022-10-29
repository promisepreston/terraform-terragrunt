terraform {
  required_version = "~> 1.3.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.37.0"
    }
  }

  backend "s3" {
    profile        = "default"
    bucket         = "localhost-terraform"
    key            = "terraform/environments/dev/s3/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  profile = "default"
  region  = local.aws_region
}

locals {
  aws_region      = "eu-west-1"
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  # For local modules
  # source = "../../../modules/aws/s3-bucket"
  version = "~> 3.4"

  bucket = var.bucket
  acl    = var.acl

  versioning = {
    enabled = var.versioning.true
  }
}
