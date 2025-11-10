locals {
  project_owner = "blennies"

  gh_repositories = {
    infrastructure = {
      name        = "infrastructure"
      description = "Infrastructure-as-code repository for \"Blennies\" projects."
    }
    unbikit = {
      name        = "unbikit"
      description = "Decoder for .bik video files that can be used to play or transcode videos."
    }
  }
}
