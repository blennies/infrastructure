locals {
  project_owner = "blennies"

  gh_repositories = {
    infrastructure = {
      name        = "infrastructure"
      description = "Infrastructure-as-code repository for gitops."
    }
    # lexalot = {
    #   name = "lexalot"
    # }
  }
}
