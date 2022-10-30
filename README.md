# README

This is a simple project that implements the features of **terragrunt** for a similar **terraform** project.

This will help you to get started on how to start integrating **terragrunt** into your **terraform** projects.

The terraform version is specified in the `.terraform-version` file in the root directory
The terragrunt version is specified in the `.terragrunt-version` file in the root directory

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

    terragrunt run-all init
    terragrunt run-all plan
    terragrunt run-all validate
    terragrunt run-all apply
    terragrunt run-all destroy

Import existing resources:

    terragrunt import module.module_name.resource_name.local_resource_name resource
