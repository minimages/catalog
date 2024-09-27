locals {
  default_config = {
    accounts   = { run-as = 65534 }
    entrypoint = { command = var.name }
    work-dir   = "/src",
    annotations = {
      "org.opencontainers.image.source"      = "https://github.com/minimages/catalog"
      "org.opencontainers.image.description" = "minimages ${var.name}"
    }
    paths = [
      {
        path        = "/src",
        type        = "directory",
        uid         = 65532,
        gid         = 65532,
        permissions = 511
      }
    ]
  }

  digest     = split("@", apko_build.image.id)[1]
  digest_dev = split("@", apko_build.dev_image.id)[1]

  tags = merge(
    { "latest" = local.digest },
    { "latest-dev" = local.digest_dev },
    { for tag in slice(data.apko_tags.package["this"].tags, 0, var.tags_count) : tag => local.digest if !strcontains(tag, "-r") },
    { for tag in slice(data.apko_tags.package["this"].tags, 0, var.tags_count) : "${tag}-dev" => local.digest_dev if !strcontains(tag, "-r") }
  )
}

data "apko_config" "image" {
  extra_packages  = var.packages
  config_contents = jsonencode(merge(local.default_config, var.config))
}

data "apko_config" "dev_image" {
  extra_packages  = concat(var.dev_packages, var.packages)
  config_contents = jsonencode(merge(local.default_config, var.config))
}

data "apko_tags" "package" {
  for_each       = var.tags_from_package == null ? { this = var.packages[0] } : { this = var.tags_from_package }
  config         = apko_build.image.config
  target_package = each.value
}

resource "apko_build" "image" {
  repo   = var.repository
  config = data.apko_config.image.config
}

resource "apko_build" "dev_image" {
  repo   = var.repository
  config = data.apko_config.dev_image.config
}

resource "oci_tags" "package_tags" {
  repo = var.repository
  tags = local.tags
}

output "tags" {
  value = keys(local.tags)
}

output "digests" {
  value = {
    latest = local.digest
    "latest-dev" = local.digest_dev
  }
}
