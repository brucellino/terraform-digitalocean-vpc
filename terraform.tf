terraform {
  required_version = ">=1.2.0"
  required_providers {

    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">=2.22.2"
    }
  }
}
