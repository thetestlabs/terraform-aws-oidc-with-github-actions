# terraform-aws-oidc-with-github-actions

A Terraform module to configure OIDC between GitHub Actions and AWS.

The module configures Federation with your AWS account using Github Actions as an Open ID Connect (OIDC) identity provider. This allows you to assume an IAM role within your account with short-lived credentials, removing the need for secrets management.

## Usage


```hcl
provider "aws" {
  region = "eu-west-2"
}

module "terraform-aws-oidc-with-github-actions" {
  source = "../../"

  github_org = "thetestlabs"
  github_repositories = [
    "example_repo_1",
    "example_repo_2",
  ]

}
```