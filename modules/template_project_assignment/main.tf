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

# Get project from names
data "env0_project" "project" {
  for_each = toset(var.projects)
  name     = each.key
}

data "env0_template" "template" {
  id = var.template_id
}

# Assign each project with template_id
resource "env0_template_project_assignment" "assignment" {
  for_each = data.env0_project.project

  template_id = var.template_id
  project_id  = each.value.id
}


variable "template_id" {
  type        = string
  description = "template id"
}

variable "projects" {
  type        = list(string)
  description = "list of project names"
}

output "template" {
  value = data.env0_template.template.name
}

output "projects" {
  value = var.projects
}

output "ids" {
  value = {
    for k, v in env0_template_project_assignment.assignment : k => v.id
  }
}