locals {
  common_tags = {
    Environment = "Dev"
    Terraform = "Managed by Terraform"
  }
  var_tags = {
    tag_environment = "Dev"
    tag_terraform = "Managed by Terraform"
  }
}
