[<img src="https://assets-global.website-files.com/5dc3f52851595b160ba99670/6037a6f27d9050ef91b90a86_env0-opengraph%402x.png" alt="env0 Logo" width="300">](https://env0.com)

# Terraform env0 Template Module
Using the env0 TF provider to create an env0 Template and associate it with a set of Projects

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_env0"></a> [env0](#requirement\_env0) | 0.0.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_env0"></a> [env0](#provider\_env0) | 0.0.20 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_template_project_assignment"></a> [template\_project\_assignment](#module\_template\_project\_assignment) | modules/template_project_assignment | n/a |

## Resources

| Name | Type |
|------|------|
| [env0_template.template](https://registry.terraform.io/providers/env0/env0/0.0.20/docs/resources/template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_templates"></a> [templates](#input\_templates) | define a set of templates assigned to projects | <pre>map(<br>    object({<br>      name                   = string<br>      description            = string<br>      repository             = string<br>      path                   = string<br>      revision               = string<br>      ssh_keys               = list(string)<br>      github_installation_id = number<br>      projects               = list(string)<br>    })<br>  )</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
