# ------------------------------------------------------------------------------
# Core resource definitions
#
# This file contains the core infrastructure resources for the module
# The code here is responsible for creating and configuring all cloud resources
# based on input variables
# ------------------------------------------------------------------------------

# Create VPC
resource "alicloud_vpc" "vpc" {
  cidr_block = var.vpc_config.cidr_block
  vpc_name   = var.vpc_config.vpc_name
  tags       = var.common_tags
}

# Create VSwitch
resource "alicloud_vswitch" "vswitch" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.vswitch_config.cidr_block
  zone_id      = var.vswitch_config.zone_id
  vswitch_name = var.vswitch_config.vswitch_name
  tags         = var.common_tags
}

# Create PolarDB cluster
resource "alicloud_polardb_cluster" "polardb_cluster" {
  vpc_id              = alicloud_vpc.vpc.id
  db_type             = var.polardb_cluster_config.db_type
  vswitch_id          = alicloud_vswitch.vswitch.id
  db_version          = var.polardb_cluster_config.db_version
  creation_category   = var.polardb_cluster_config.creation_category
  storage_space       = var.polardb_cluster_config.storage_space
  hot_standby_cluster = var.polardb_cluster_config.hot_standby_cluster
  db_node_class       = var.polardb_cluster_config.db_node_class
  pay_type            = var.polardb_cluster_config.pay_type
  storage_type        = var.polardb_cluster_config.storage_type
  security_ips        = var.polardb_cluster_config.security_ips
  db_node_num         = var.polardb_cluster_config.db_node_num
  description         = var.polardb_cluster_config.description
  tags                = var.common_tags
}

# Create PolarDB account
resource "alicloud_polardb_account" "account" {
  db_cluster_id    = alicloud_polardb_cluster.polardb_cluster.id
  account_name     = var.polardb_account_config.account_name
  account_password = var.polardb_account_config.account_password
  account_type     = var.polardb_account_config.account_type
}

# Create PolarDB endpoint address
resource "alicloud_polardb_endpoint_address" "endpoint_address" {
  db_cluster_id  = alicloud_polardb_cluster.polardb_cluster.id
  db_endpoint_id = var.polardb_endpoint_config.db_endpoint_id
  net_type       = var.polardb_endpoint_config.net_type

  depends_on = [
    alicloud_polardb_account.account
  ]
}

# Create PolarDB database
resource "alicloud_polardb_database" "database" {
  db_cluster_id = alicloud_polardb_cluster.polardb_cluster.id
  db_name       = var.polardb_database_config.db_name
  account_name  = alicloud_polardb_account.account.account_name
}

# Create OSS bucket
resource "alicloud_oss_bucket" "bucket" {
  bucket          = var.oss_bucket_config.bucket_name
  force_destroy   = var.oss_bucket_config.force_destroy
  redundancy_type = var.oss_bucket_config.redundancy_type
  storage_class   = var.oss_bucket_config.storage_class
  tags            = var.common_tags
}