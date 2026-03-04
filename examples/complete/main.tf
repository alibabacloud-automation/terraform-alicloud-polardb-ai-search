# ------------------------------------------------------------------------------
# Complete example for PolarDB AI Search module
#
# This example demonstrates the basic usage of the PolarDB AI Search module
# It creates a complete infrastructure for AI-powered search capabilities
# ------------------------------------------------------------------------------

# Configure the Alibaba Cloud provider
provider "alicloud" {
  region = var.region
}

# Generate random string for unique bucket name
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

# Get available zones
data "alicloud_polardb_node_classes" "default" {
  db_type  = "PostgreSQL"
  pay_type = "PostPaid"
  category = "SENormal"
}
# Get PolarDB endpoints after cluster creation
data "alicloud_polardb_endpoints" "default" {
  db_cluster_id = module.polardb_ai_search.polardb_cluster_id
}

# Use the PolarDB AI Search module
module "polardb_ai_search" {
  source = "../../"

  # Common configuration
  common_tags = {
    Environment = "example"
    Project     = "polardb-ai-search"
    Owner       = "terraform"
  }

  # VPC configuration
  vpc_config = {
    cidr_block = "192.168.0.0/16"
    vpc_name   = "${var.name_prefix}-vpc"
  }

  # VSwitch configuration
  vswitch_config = {
    cidr_block   = "192.168.1.0/24"
    zone_id      = data.alicloud_polardb_node_classes.default.classes[0].zone_id
    vswitch_name = "${var.name_prefix}-vswitch"
  }

  # PolarDB cluster configuration
  polardb_cluster_config = {
    db_type             = "PostgreSQL"
    db_version          = "14"
    creation_category   = "SENormal"
    storage_space       = 20
    hot_standby_cluster = "OFF"
    db_node_class       = "polar.pg.g2.2xlarge.c"
    pay_type            = "PostPaid"
    storage_type        = "ESSDPL1"
    security_ips        = ["127.0.0.1", "0.0.0.0/0"]
    db_node_num         = 2
    description         = "PolarDB cluster for AI search example"
  }

  # PolarDB account configuration
  polardb_account_config = {
    account_name     = var.db_account_name
    account_password = var.db_password
    account_type     = "Super"
  }

  # PolarDB endpoint configuration
  polardb_endpoint_config = {
    db_endpoint_id = data.alicloud_polardb_endpoints.default.endpoints[0].db_endpoint_id
    net_type       = "Public"
  }

  # PolarDB database configuration
  polardb_database_config = {
    db_name = var.db_name
  }

  # OSS bucket configuration
  oss_bucket_config = {
    bucket_name     = "${var.name_prefix}-bucket-${random_string.bucket_suffix.result}"
    force_destroy   = true
    redundancy_type = "ZRS"
    storage_class   = "Standard"
  }
}