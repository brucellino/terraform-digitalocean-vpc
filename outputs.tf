# terraform-digitalocean-vpc outputs
output "vpc_cidr" {
  value = digitalocean_vpc.vpc.ip_range
}
