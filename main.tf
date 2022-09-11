# The VPC is usally used as a container to include droplets and other resources into.
# These resources can be added to the project later, but the VPC itself cannot.
# We therefore make the project depend on the creation of the VPC, since when it comes
# time to destroy the VPC, we first want all of the resources in it destroyed, before
# we proceed to destroy the project itself.
resource "digitalocean_project" "p" {
  depends_on  = [digitalocean_vpc.vpc]
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
