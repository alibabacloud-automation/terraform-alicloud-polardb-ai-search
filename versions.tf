# ------------------------------------------------------------------------------
# Terraform version requirements
#
# This file specifies the minimum Terraform version and required providers
# for this module to function correctly
# ------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.0"

  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">= 1.200.0"
    }
  }
}