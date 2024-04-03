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

variable "vpc_name" {
  type        = string
  default     = "test-example-vpc"
  description = "name of the VPC to create"
}

variable "project_name" {
  type = string
}

module "example" {
  source = "../../"
  project = {
    name        = var.project_name
    description = "Test project for CI purposes"
    purpose     = "Continuous integration"
    environment = "development"
    is_default  = false
  }
  vpc_name        = var.vpc_name
  vpc_description = "Test VPC for CI"
  vpc_region      = "ams3"
}
