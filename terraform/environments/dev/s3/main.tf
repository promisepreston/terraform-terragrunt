locals {
  tag_environment = "Dev"
  tag_terraform = "Managed by Terraform"
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.4"

  bucket = var.bucket
  acl    = var.acl
  versioning = {
    enabled = var.versioning.true
  }
  tags = {
    Environment = local.tag_environment
    Terraform   = local.tag_terraform
  }
}

module "s3_bucket_object" {
  source = "../../../modules/s3-object"

  bucket_name     = module.s3_bucket.s3_bucket_id
  object_key      = var.object_key[1]
  source_file     = "files/stderr.txt"
  tag_environment = local.tag_environment
  tag_terraform   = local.tag_terraform

  depends_on = [module.s3_bucket]
}
