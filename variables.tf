
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
  type        = object({
    name        = string
    description = string
    purpose     = string
    environment = string
    is_default  = bool
  })
  description = "Project configuration"
  default = {
    name        = "My_Project"
    description = "My project"
    purpose     = "Personal"
    environment = "development"
    is_default  = false
  }
}
