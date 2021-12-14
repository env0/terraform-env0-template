terraform {
  required_providers {
    env0 = {
      source  = "env0/env0"
      version = "0.0.20"
    }
  }
  experiments = [module_variable_optional_attrs]
}

provider "env0" {
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
  type                   = "terraform"
}

# Using module as a helper
# Take each template, and assign the projects
module "template_project_assignment" {
  source = "./modules/template_project_assignment"

  for_each = env0_template.template

  template_id = each.value.id
  project_id  = var.templates[each.key].projects
}

variable "templates" {
  type = map(
    object({
      name                   = string
      description            = string
      repository             = string
      path                   = string
      revision               = string
      ssh_keys               = list(string)
      github_installation_id = number
      projects               = list(string)
    })
  )
  description = "define a set of templates assigned to projects"
}