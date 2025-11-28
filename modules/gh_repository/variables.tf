variable "name" {
  type        = string
  description = "Name of the repository/project."
  nullable    = false
}

variable "description" {
  type        = string
  description = "Short human-readable summary about the repository/project."
  default     = null
}

variable "homepage_url" {
  type        = string
  description = "URL of the website associated with the project."
  default     = null
}

variable "enable_gh_pages" {
  type        = bool
  description = "Whether to enable the creation of a GitHub Pages website for this project."
  default     = false
}

variable "topics" {
  type        = set(string)
  description = "Set of topics that apply to the repository/project."
  default     = null
}

variable "required_pr_ci_job_successes" {
  type        = set(string)
  description = "Set of CI job IDs/names that must succeed before a PR can be merged."
  default     = []
}
