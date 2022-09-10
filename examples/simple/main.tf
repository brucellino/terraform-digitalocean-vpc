terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.2"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.22.0"
    }
  }
  backend "consul" {
    path = "terraform/modules/tfmod-digitalocean-vpc"
  }
}

provider "vault" {
  # Configuration options
}

data "vault_generic_secret" "do" {
  path = "kv/do"
}

provider "digitalocean" {
  token = data.vault_generic_secret.do.data["token"]
}

module "example" {
  source = "../../"
  project = {
    name        = "CI"
    description = "Test project for CI purposes"
    purpose     = "Continuous integration"
    environment = "development"
  }
  vpc_name        = "ci-vpc"
  vpc_description = "Test VPC for CI"
  vpc_region      = "ams2"
}
