[![main](https://github.com/brucellino/terraform-digitalocean-vpc/actions/workflows/release.yml/badge.svg)](https://github.com/brucellino/terraform-digitalocean-vpc/actions/workflows/release.yml)[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit) [![pre-commit.ci status](https://results.pre-commit.ci/badge/github/brucellino/terraform-digitalocean-vpc/main.svg)](https://results.pre-commit.ci/latest/github/brucellino/terraform-digitalocean-vpc/main) [![semantic-release: conventional](https://img.shields.io/badge/semantic--release-conventional-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

# Terraform Module DigitalOcean VPC

This module creates a DigitalOcean VPC with associated project.

## Examples

The `examples/` directory contains the example usage of this module.
These examples show how to use the module in your project, and are also use for testing in CI/CD.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >=2.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >=2.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_project.p](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project) | resource |
| [digitalocean_vpc.vpc](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | Project configuration | <pre>object({<br>    name        = string<br>    description = string<br>    purpose     = string<br>    environment = string<br>    is_default  = bool<br>  })</pre> | <pre>{<br>  "description": "My project",<br>  "environment": "development",<br>  "is_default": false,<br>  "name": "My_Project",<br>  "purpose": "Personal"<br>}</pre> | no |
| <a name="input_vpc_description"></a> [vpc\_description](#input\_vpc\_description) | Description of the VPC | `string` | `"My VPC is the raddest"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC to create | `string` | `"my-vpc"` | no |
| <a name="input_vpc_region"></a> [vpc\_region](#input\_vpc\_region) | Slug of the digitalocean region | `string` | `"ams3"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | terraform-digitalocean-vpc outputs |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->
