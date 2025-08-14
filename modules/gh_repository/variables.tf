variable "name" {
  type        = string
  description = "Name of the repository."
  nullable    = false
}

variable "description" {
  type        = string
  description = "Short human-readable summary about the repository."
  default     = null
}

variable "topics" {
  type        = set(string)
  description = "Set of topics that apply to the repository."
  default     = null
}
