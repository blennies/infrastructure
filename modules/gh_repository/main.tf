resource "github_repository" "default" {
  name        = var.name
  description = coalesce(var.description, "Repository for ${var.name}")
  topics      = var.topics

  visibility = "public"

  has_issues      = true
  has_discussions = false
  has_projects    = true
  has_wiki        = false

  allow_merge_commit          = false
  allow_rebase_merge          = false
  allow_squash_merge          = true
  allow_update_branch         = true
  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"
  delete_branch_on_merge      = true
  web_commit_signoff_required = true

  auto_init          = true
  archive_on_destroy = false

  vulnerability_alerts                    = true
  ignore_vulnerability_alerts_during_read = true

  security_and_analysis {
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }
}

resource "github_branch" "main" {
  repository = github_repository.default.name
  branch     = "main"
}

resource "github_branch_default" "default" {
  repository = var.name
  branch     = github_branch.main.branch
}

resource "github_branch_protection" "default" {
  repository_id = github_repository.default.node_id

  pattern                = "main"
  enforce_admins         = true
  require_signed_commits = true
  allows_deletions       = false

  allows_force_pushes = false
  force_push_bypassers = [
    "/blennies",
  ]

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    restrict_dismissals             = false
    required_approving_review_count = 0
  }
}
