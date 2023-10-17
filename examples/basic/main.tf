module "my_templates" {
  source = "../.."

  templates = {
    a = {
      name              = "My New EC2 Template v2"
      description       = "Golden EC2 template for acme team"
      repository        = "https://github.com/env0/acme-demo"
      path              = "simple-ec2-instance"
      revision          = "main"
      terraform_version = "1.5.7"
    },
    b = {
      name              = "My EC2 Template v1"
      description       = "Golden EC2 template for dev team"
      repository        = "https://github.com/env0/acme-demo"
      path              = "simple-ec2-instance"
      revision          = "main"
      terraform_version = "1.5.6"
    }
  }

  github_installation_id = "11551359"

  ssh_key = "env0 gh away"
}