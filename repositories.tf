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
