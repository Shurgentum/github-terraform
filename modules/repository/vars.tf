variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "visibility" {
  type    = string
  default = "private"
  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "Visibility must be 'public', 'private' or 'internal'"
  }
}

variable "pr_closing" {
  type = object({
    merge  = bool
    squash = bool
    rebase = bool
  })
  default = {
    merge  = false,
    squash = true,
    rebase = false
  }
}

variable "delete_branch_on_merge" {
  type    = bool
  default = true
}


variable "gitignore_template" {
  type        = string
  default     = null
  description = "https://github.com/github/gitignore"
}
