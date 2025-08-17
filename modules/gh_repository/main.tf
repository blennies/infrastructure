# Ensure the repository exists with the standard settings
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

# Ensure "main" is the default branch and protect it
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

# Ensure consistent labels for project management
resource "github_issue_labels" "default" {
  repository = github_repository.default.name

  label {
      color       = "0075ca"
      description = "Improvements or additions to documentation"
      name        = "documentation"
  }
  label {
      color       = "008672"
      description = "Extra attention is needed"
      name        = "help wanted"
  }
  label {
      color       = "388f7b"
      description = "Improvements or additions to the CI/CD flow"
      name        = "ci/cd"
  }
  label {
      color       = "7057ff"
      description = "Good for newcomers"
      name        = "good first issue"
  }
  label {
      color       = "a2eeef"
      description = "New feature or request"
      name        = "enhancement"
  }
  label {
      color       = "cfd3d7"
      description = "This issue or pull request already exists"
      name        = "duplicate"
  }
  label {
      color       = "d73a4a"
      description = "Something isn't working"
      name        = "bug"
  }
  label {
      color       = "d876e3"
      description = "Further information is requested"
      name        = "question"
  }
  label {
      color       = "e4e669"
      description = "This doesn't seem right"
      name        = "invalid"
  }
  label {
      color       = "ffffff"
      description = "This will not be worked on"
      name        = "wontfix"
  }
}
