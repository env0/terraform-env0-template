// var templates
// note: implicitly requires template.name to be unique otherwise data lookups will fail
variable "templates" {
  type = list(
    object({
      name              = string
      description       = string
      repository        = string
      path              = string
      revision          = string
      terraform_version = string
      ssh_keys          = list(map(string))
    })
  )
  description = "define a list of templates assigned to projects"
}

variable "github_installation_id" {
  type    = string
  default = ""
}

variable "ssh_key" {
  type        = string
  default     = ""
  description = "name of ssh-key used by env0_ssh_key (Data Source)"
}