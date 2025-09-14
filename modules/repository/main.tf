resource "github_repository" "this" {
  name        = var.name
  description = var.description

  visibility = var.visibility

  allow_merge_commit = var.pr_closing.merge
  allow_squash_merge = var.pr_closing.squash
  allow_rebase_merge = var.pr_closing.rebase

  delete_branch_on_merge = var.delete_branch_on_merge

  auto_init = true

  gitignore_template = var.gitignore_template

  archive_on_destroy = true
}

data "github_branch" "main" {
  repository = github_repository.this.name
  branch     = "main"
  depends_on = [github_repository.this]
}

resource "github_branch_default" "main" {
  repository = github_repository.this.name
  branch     = data.github_branch.main.branch
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.this.id
  pattern       = data.github_branch.main.branch

  require_signed_commits = true
  enforce_admins         = true
}
