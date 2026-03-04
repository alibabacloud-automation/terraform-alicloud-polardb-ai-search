# ------------------------------------------------------------------------------
# Module input variables
#
# This file defines all configurable input variables for this Terraform module
# Each variable includes detailed descriptions to help users configure the module correctly
# ------------------------------------------------------------------------------

variable "common_tags" {
  type        = map(string)
  description = "Common tags to be applied to all resources."
  default     = {}
}

variable "vpc_config" {
  type = object({
    cidr_block = string
    vpc_name   = optional(string, "polardb-ai-search-vpc")
  })
  description = "Configuration for VPC. The 'cidr_block' attribute is required."
}

variable "vswitch_config" {
  type = object({
    cidr_block   = string
    zone_id      = string
    vswitch_name = optional(string, "polardb-ai-search-vswitch")
  })
  description = "Configuration for VSwitch. The 'cidr_block' and 'zone_id' attributes are required."
}

variable "polardb_cluster_config" {
  type = object({
    db_type             = optional(string, "PostgreSQL")
    db_version          = optional(string, "14")
    creation_category   = optional(string, "SENormal")
    storage_space       = optional(number, 20)
    hot_standby_cluster = optional(string, "OFF")
    db_node_class       = optional(string, "polar.pg.g2.2xlarge.c")
    pay_type            = optional(string, "PostPaid")
    storage_type        = optional(string, "ESSDPL1")
    security_ips        = optional(list(string), ["127.0.0.1", "0.0.0.0/0"])
    db_node_num         = optional(number, 2)
    description         = optional(string, "PolarDB cluster for AI search")
  })
  description = "Configuration for PolarDB cluster. All attributes have sensible defaults."
  default     = {}
}

variable "polardb_account_config" {
  type = object({
    account_name     = string
    account_password = string
    account_type     = optional(string, "Super")
  })
  description = "Configuration for PolarDB account. The 'account_name' and 'account_password' attributes are required."
}

variable "polardb_endpoint_config" {
  type = object({
    db_endpoint_id = string
    net_type       = optional(string, "Public")
  })
  description = "Configuration for PolarDB endpoint address. The 'db_endpoint_id' attribute is required."
}

variable "polardb_database_config" {
  type = object({
    db_name = string
  })
  description = "Configuration for PolarDB database. The 'db_name' attribute is required."
}

variable "oss_bucket_config" {
  type = object({
    bucket_name     = string
    force_destroy   = optional(bool, true)
    redundancy_type = optional(string, "ZRS")
    storage_class   = optional(string, "Standard")
  })
  description = "Configuration for OSS bucket. The 'bucket_name' attribute is required."
}