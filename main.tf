module "gh_repository" {
  source   = "./modules/gh_repository"
  for_each = local.gh_repositories

  name         = each.value.name
  description  = lookup(each.value, "description", null)
  homepage_url = lookup(each.value, "homepage_url", null)
  topics       = lookup(each.value, "topics", null)

  enable_gh_pages = lookup(each.value, "enable_gh_pages", false)

  required_pr_ci_job_successes = lookup(each.value, "required_pr_ci_job_successes", [])
}
