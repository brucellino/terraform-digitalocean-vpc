resource "digitalocean_project" "p" {
  name        = var.project.name
  description = var.project.description
  purpose     = var.project.purpose
  environment = var.project.environment
}

resource "digitalocean_vpc" "vpc" {
  name        = var.vpc_name
  region      = var.vpc_region
  description = var.vpc_description
}
