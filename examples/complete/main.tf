provider "aws" {
  region = "eu-west-2"
}



module "oidc-with-github-actions" {
  source  = "thetestlabs/oidc-with-github-actions/aws"
  version = "0.1.3"

  github_org = "thetestlabs"
  github_repositories = [
    "tftest.io",
    "terraform-aws-oidc-with-github-actions",
  ]
  iam_role_name        = "Example_OIDC_Role"
  iam_role_description = "Enable GitHub OIDC access"
  max_session_duration = 3600
  iam_role_policy      = "AdministratorAccess"
  iam_role_path        = "/security/"
}