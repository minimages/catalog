terraform {
  required_providers {
    apko = {
      source  = "chainguard-dev/apko"
      version = "0.26.0"
    }

    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.17"
    }
  }
}

provider "apko" {
  extra_repositories = ["https://packages.wolfi.dev/os"]
  extra_keyring      = ["https://packages.wolfi.dev/os/wolfi-signing.rsa.pub"]
  default_archs      = ["amd64", "arm64"]
}

variable "config_path" {
  type    = string
  default = "images.yaml"
}

locals {
  spec = yamldecode(file(var.config_path))
}

module "images" {
  source     = "./build"
  images     = local.spec.images
  repository = local.spec.repository
  cosign     = local.spec.cosign
}

resource "local_file" "tags" {
  content  = yamlencode(module.images.tags)
  filename = "tags.yaml"
}
