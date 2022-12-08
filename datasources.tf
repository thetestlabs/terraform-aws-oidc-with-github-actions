
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume_role" {
  count = var.enabled ? 1 : 0

  statement {
    sid = "1"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github[0].arn]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        for repo in var.github_repositories : "repo:${var.github_org}/${repo}:*"
      ]
    }

  }
}

data "aws_iam_policy" "attach_policy" {
  name = var.iam_role_policy
}
