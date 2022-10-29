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
  tags        = local.common_vars.locals.common_tags
}

terraform {
  # Deploy version v3.3.0
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-cloudwatch.git//modules/log-group?ref=v3.3.0"

  # For terraform registry modules
  # tfr://registry.terraform.io/terraform-aws-modules/s3-bucket/aws?version=3.4.1 OR
  # tfr:///terraform-aws-modules/iam/aws//modules/aws-s3-bucket?version=3.4.1
}

# (Note: the double slash (//) in the source parameter is intentional and required. It’s part of Terraform’s Git syntax for module sources. Terraform may display a “Terraform initialized in an empty directory” warning, but you can safely ignore it.)

inputs = {
  name              = "localhost-terraform"
  retention_in_days = 120
  tags = local.tags
}
