resource "aws_s3_object" "main" {
  bucket = var.bucket_name
  key    = var.object_key
  source = var.source_file

  tags = {
    Environment = var.tag_environment
    Terraform   = var.tag_terraform
  }
}
