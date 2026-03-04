# ------------------------------------------------------------------------------
# Terraform version requirements for the complete example
#
# This file specifies the minimum Terraform version and required providers
# for the complete example to function correctly
# ------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.0"

  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">= 1.200.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}