locals {
  common_tags = {
    Environment = "Prod"
    Terraform = "Managed by Terraform"
  }
  var_tags = {
    tag_environment = "Prod"
    tag_terraform = "Managed by Terraform"
  }
}
