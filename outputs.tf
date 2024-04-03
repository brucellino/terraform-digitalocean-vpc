# terraform-digitalocean-vpc outputs
output "vpc_cidr" {
  value = digitalocean_vpc.vpc.ip_range
}

output "vpc_id" {
  value = digitalocean_vpc.vpc.id
}
