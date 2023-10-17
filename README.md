[<img src="https://assets-global.website-files.com/5dc3f52851595b160ba99670/6037a6f27d9050ef91b90a86_env0-opengraph%402x.png" alt="env0 Logo" width="300">](https://env0.com)

# Terraform env0 Template Module
Using the env0 TF provider to create an env0 Template and associate it with a set of Projects

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |
| <a name="requirement_env0"></a> [env0](#requirement\_env0) | >= 1.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_env0"></a> [env0](#provider\_env0) | 1.15.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [env0_template.template](https://registry.terraform.io/providers/env0/env0/latest/docs/resources/template) | resource |
| [env0_ssh_key.keys](https://registry.terraform.io/providers/env0/env0/latest/docs/data-sources/ssh_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_installation_id"></a> [github\_installation\_id](#input\_github\_installation\_id) | n/a | `string` | `""` | no |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | name of ssh-key used by env0\_ssh\_key (Data Source) | `string` | `""` | no |
| <a name="input_templates"></a> [templates](#input\_templates) | define a list of templates assigned to projects | <pre>list(<br>    object({<br>      name              = string<br>      description       = string<br>      repository        = string<br>      path              = string<br>      revision          = string<br>      terraform_version = string<br>      ssh_keys          = list(map(string))<br>    })<br>  )</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_templates"></a> [templates](#output\_templates) | templates created and managed by env0 |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
