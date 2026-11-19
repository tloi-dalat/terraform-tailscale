terraform {
  required_version = ">= 1.10"

  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "~> 0.30"
    }
    infisical = {
      source  = "infisical/infisical"
      version = "~> 0.20"
    }
  }
}

provider "tailscale" {}
provider "infisical" {}
