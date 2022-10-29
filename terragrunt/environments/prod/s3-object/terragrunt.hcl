# The include block tells Terragrunt to use the
# exact same Terragrunt configuration from the
# terragrunt.hcl file specified via the path parameter.
# It behaves exactly as if you had copy/pasted the
# Terraform configuration from the included file generate
# configuration into the child, but this approach is much easier to maintain!

include "root" {
  path = find_in_parent_folders()
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  tags        = local.common_vars.locals.var_tags
}

dependency "s3_bucket" {
  config_path = "../s3/"

  mock_outputs = {
    s3_bucket_id = "temporary-s3-bucket-name"
  }
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs_merge_strategy_with_state = "shallow"
}

terraform {
  source = "../../../modules//s3-object"
}
# (Note: the double slash (//) in the source parameter is intentional and required.

inputs = {
  bucket_name     = dependency.s3_bucket.outputs.s3_bucket_id
  object_key      = "log-files/"
  source_file     = "files/stderr.txt"
  tag_environment = local.common_vars.locals.var_tags.tag_environment
  tag_terraform   = local.common_vars.locals.var_tags.tag_terraform
}
