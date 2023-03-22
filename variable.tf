variable "environment_suffix" {
  type        = string
  description = "The suffix to append to the environment name"
  default     = "-dev"
}

variable "project_name" {
  type    = string
}