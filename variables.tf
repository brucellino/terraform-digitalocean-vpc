
variable "vpc_name" {
  type        = string
  description = "Name of the VPC to create"
  default     = "my-vpc"
}

variable "vpc_region" {
  type        = string
  description = "Slug of the digitalocean region"
  default     = "ams3"
}

variable "vpc_description" {
  type        = string
  description = "Description of the VPC"
  default     = "My VPC is the raddest"
}

variable "project" {
  type        = map(string)
  description = "Project configuration"
  default = {
    name        = "My_Project"
    description = "My project"
    purpose     = "Personal"
    environment = "development"
  }
}
