provider "aws" {
  region = "eu-west-2"
}

module "terraform-aws-oidc-with-github-actions" {
  source = "../../"

  github_org = "thetestlabs"
  github_repositories = [
    "terraform-aws-oidc-with-github-actions"
  ]

}
