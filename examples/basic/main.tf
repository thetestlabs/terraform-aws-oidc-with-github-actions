provider "aws" {
  region = "eu-west-2"
}

module "oidc-with-github-actions" {
  source  = "thetestlabs/oidc-with-github-actions/aws"
  version = "0.1.4"

  github_org = "thetestlabs"
  github_repositories = [
    "terraform-aws-oidc-with-github-actions"
  ]

}
