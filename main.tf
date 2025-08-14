module "gh_repository" {
  source   = "./modules/gh_repository"
  for_each = local.gh_repositories

  name        = each.value.name
  description = lookup(each.value, "description", null)
  topics      = lookup(each.value, "topics", null)
}
