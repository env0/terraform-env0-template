data "env0_ssh_key" "keys" {
  count = (var.ssh_key == "") ? 0 : 1
  name  = var.ssh_key
}

# Create each template
resource "env0_template" "template" {
  for_each = local.templates

  name                   = each.value.name
  description            = each.value.description
  repository             = each.value.repository
  path                   = each.value.path
  revision               = each.value.revision
  ssh_keys               = data.env0_ssh_key.keys
  github_installation_id = var.github_installation_id
  terraform_version      = each.value.terraform_version
  type                   = "terraform"
}

locals {
  templates = {
    for k, v in var.templates : v.name => v
  }

  // not used anywhere, just an example of what the variable input would look like
  my_templates = [
    {
      name              = "My New EC2 Template"
      description       = "Golden EC2 template for dev team"
      repository        = "https://github.com/env0/acme-demo"
      path              = "simple-ec2-instance"
      revision          = "main"
      terraform_version = "1.5.7"
    },
    {
      name              = "My EC2 Template"
      description       = "Golden EC2 template for dev team"
      repository        = "https://github.com/env0/acme-demo"
      path              = "simple-ec2-instance"
      revision          = "main"
      terraform_version = "1.5.6"
    }
  ]
}
