provider "aws" {
  region = "eu-west-2"
}

module "terraform-aws-oidc-federation-with-github-actions" {
  source = "../../"

  github_org = "thetestlabs"
  github_repositories = [
    "tftest.io",
    "terraform-aws-oidc-federation-with-github-actions",
  ]
  iam_role_name        = "Example_OIDC_Role"
  iam_role_description = "Enable GitHub OIDC access"
  max_session_duration = 3600
  iam_role_policy      = "AdministratorAccess"
  iam_role_path        = "/security/"
}