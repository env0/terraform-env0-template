// templates
variable "templates" {
  type = map(
    object({
      name              = string
      description       = string
      repository        = string
      path              = string
      revision          = string
      terraform_version = string
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