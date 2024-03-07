variable "github_org" {
  description = "GitHub organisation name."
  type        = string
  default     = "thetestlabs"
}

variable "github_repositories" {
  description = "List of GitHub repository names."
  type        = list(string)
  default = [
    "tftest.io",
    "terraform-github-aws-oidc",
  ]
}

variable "iam_role_name" {
  description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = "GitHubOIDCRole"
}

variable "iam_role_description" {
  description = "Description of the role"
  type        = string
  default     = "IAM role to enable GitHub OIDC access"
}
