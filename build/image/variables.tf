variable "name" {
  type = string
}

variable "repository" {
  type = string
}

variable "packages" {
  type    = list(string)
  default = []
}

variable "tags_from_package" {
  type    = string
  default = null
}

variable "dev_packages" {
  type    = list(string)
  default = ["apk-tools", "busybox"]
}

variable "config" {
  type = any
}

variable "tags_count" {
  type        = number
  default     = 3
  description = "Number of semver segments to use for tags"
}
