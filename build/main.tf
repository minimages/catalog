variable "repository" {
  type = string
}

variable "images" {
  type = any
}

locals {
  images = { for k, v in var.images : k => merge({
    config     = {}
    tags_count = 3
  }, v) }
}

module "image" {
  source   = "./image"
  for_each = local.images

  name       = each.key
  repository = "${var.repository}/${each.key}"
  packages   = each.value.packages
  config     = each.value.config
  tags_count = each.value.tags_count
}

output "tags" {
    value = { for k, v in module.image : k => v.tags }
}