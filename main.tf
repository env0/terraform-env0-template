terraform {
  required_providers {
    env0 = {
      source  = "env0/env0"
      version = "0.2.24"
    }
  }
  experiments = [module_variable_optional_attrs]
}

# Create each template
resource "env0_template" "template" {
  for_each = var.templates

  name                   = each.value.name
  description            = each.value.description
  repository             = each.value.repository
  path                   = each.value.path
  revision               = each.value.revision
  ssh_keys               = each.value.ssh_keys
  github_installation_id = each.value.github_installation_id
  terraform_version      = each.value.terraform_version
  type                   = "terraform"
}

# Using module as a helper
# Take each template, and assign the projects
module "template_project_assignment" {
  source = "./modules/template_project_assignment"

  for_each = env0_template.template

  template_id = each.value.id
  projects    = var.templates[each.key].projects
}

variable "templates" {
  type = map(
    object({
      name                   = string
      description            = string
      repository             = string
      path                   = string
      revision               = string
      terraform_version      = string
      ssh_keys               = list(map(string))
      github_installation_id = number
      projects               = list(string)
    })
  )
  description = "define a set of templates assigned to projects"
}
