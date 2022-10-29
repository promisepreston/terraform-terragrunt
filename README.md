# README

## Setup tools

Switch to the required folder:

    cd terraform

OR

    cd terragrunt

Install brew packages specified in the `Brewfile`:

    brew bundle

Install terraform using the version specified in the `.terraform-version`:

    tfenv install
    tfenv version-name

Install terragrunt using the version specified in the `.terragrunt-version`:

    tgenv install
    tgenv version-name

Run all commands:

    terragrunt run-all plan
    terragrunt run-all validate
    terragrunt run-all apply
    terragrunt run-all destroy

Import existing resources:

    terragrunt import module.module_name.resource_name.local_resource_name resource
