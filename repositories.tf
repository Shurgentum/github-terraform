module "github_terraform" {
  source = "./modules/repository"

  name        = "github-terraform"
  description = "Management of GitHub profile and its contents"
  visibility  = "public"
  pr_closing = {
    merge  = true,
    squash = true,
    rebase = false
  }
  gitignore_template = "Terraform"
}

module "mac_ansible" {
  source = "./modules/repository"

  name        = "mac-ansible"
  description = "Mac setup and configuration via Ansible."
  visibility  = "public"

  pr_closing = {
    merge  = true
    squash = true
    rebase = true
  }
}

module "aws_management" {
  source = "./modules/repository"

  name        = "aws-management"
  description = "Terraform repository for personal AWS Organization management"
  visibility  = "private"

  pr_closing = {
    merge  = true
    squash = true
    rebase = true
  }
}
