resource "aws_iam_openid_connect_provider" "github" {
  count = var.enabled ? 1 : 0

  url             = var.oidc_url
  client_id_list  = var.client_id_list
  thumbprint_list = var.thumbprint_list

}

resource "aws_iam_role" "github" {
  count = var.enabled ? 1 : 0

  name                 = var.iam_role_name
  description          = var.iam_role_description
  assume_role_policy   = data.aws_iam_policy_document.assume_role[0].json
  max_session_duration = var.max_session_duration
  path                 = var.iam_role_path

}

resource "aws_iam_role_policy_attachment" "policy" {
  count = var.enabled ? 1 : 0

  role       = aws_iam_role.github[count.index].id
  policy_arn = data.aws_iam_policy.attach_policy.arn
}
