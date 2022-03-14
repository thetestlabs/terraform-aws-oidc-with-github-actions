# terraform-aws-oidc-with-github-actions

A Terraform module to configure OIDC between GitHub Actions and AWS.

The module configures Federation with your AWS account using Github Actions as an Open ID Connect (OIDC) identity provider. This allows you to assume an IAM role within your account with short-lived credentials, removing the need for secrets management.

## Usage

The [complete example](examples/complete/main.tf) shows all of the available options. The following [basic example](examples/basic/main.tf) shows the minimum requirement for creating an OIDC connection between AWS and your GitHub Actions.


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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id_list"></a> [client\_id\_list](#input\_client\_id\_list) | A list of client IDs (also known as audiences). | `list(string)` | <pre>[<br>  "sts.amazonaws.com"<br>]</pre> | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Flag to enable or disable the creation of resources. | `bool` | `true` | no |
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | GitHub organisation name. | `string` | n/a | yes |
| <a name="input_github_repositories"></a> [github\_repositories](#input\_github\_repositories) | List of GitHub repository names. | `list(string)` | n/a | yes |
| <a name="input_iam_role_description"></a> [iam\_role\_description](#input\_iam\_role\_description) | Description of the role | `string` | `"IAM role to enable GitHub OIDC access"` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Friendly name of the role. If omitted, Terraform will assign a random, unique name. | `string` | `"GitHubOIDCRole"` | no |
| <a name="input_iam_role_path"></a> [iam\_role\_path](#input\_iam\_role\_path) | Path to the IAM role. | `string` | `"/"` | no |
| <a name="input_iam_role_policy"></a> [iam\_role\_policy](#input\_iam\_role\_policy) | Name of the policy to be attacherd to the role. | `string` | `"ReadOnlyAccess"` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum session duration in seconds. | `number` | `3600` | no |
| <a name="input_oidc_url"></a> [oidc\_url](#input\_oidc\_url) | The URL of the identity provider. Corresponds to the iss claim. | `string` | `"token.actions.githubusercontent.com"` | no |
| <a name="input_thumbprint_list"></a> [thumbprint\_list](#input\_thumbprint\_list) | A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s). | `list(string)` | <pre>[<br>  "6938fd4d98bab03faadb97b34396831e3780aea1"<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->