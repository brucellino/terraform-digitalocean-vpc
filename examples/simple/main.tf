terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">=3.13.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.26.0"
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
  path = "digitalocean/tokens"
}

provider "digitalocean" {
  token = data.vault_generic_secret.do.data["terraform"]
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
