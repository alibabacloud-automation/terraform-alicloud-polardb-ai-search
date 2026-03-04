# ------------------------------------------------------------------------------
# Module output values
#
# This file defines the values returned by the module after successful execution
# These outputs can be referenced by other Terraform configurations or displayed to users
# ------------------------------------------------------------------------------

# VPC outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = alicloud_vpc.vpc.id
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = alicloud_vpc.vpc.vpc_name
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = alicloud_vpc.vpc.cidr_block
}

# VSwitch outputs
output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = alicloud_vswitch.vswitch.id
}

output "vswitch_name" {
  description = "The name of the VSwitch"
  value       = alicloud_vswitch.vswitch.vswitch_name
}

output "vswitch_cidr_block" {
  description = "The CIDR block of the VSwitch"
  value       = alicloud_vswitch.vswitch.cidr_block
}

output "vswitch_zone_id" {
  description = "The availability zone of the VSwitch"
  value       = alicloud_vswitch.vswitch.zone_id
}

# PolarDB cluster outputs
output "polardb_cluster_id" {
  description = "The ID of the PolarDB cluster"
  value       = alicloud_polardb_cluster.polardb_cluster.id
}

output "polardb_cluster_connection_string" {
  description = "The connection string of the PolarDB cluster"
  value       = alicloud_polardb_cluster.polardb_cluster.connection_string
}

output "polardb_cluster_port" {
  description = "The port of the PolarDB cluster"
  value       = alicloud_polardb_cluster.polardb_cluster.port
}

output "polardb_cluster_status" {
  description = "The status of the PolarDB cluster"
  value       = alicloud_polardb_cluster.polardb_cluster.status
}

# PolarDB account outputs
output "polardb_account_name" {
  description = "The name of the PolarDB account"
  value       = alicloud_polardb_account.account.account_name
}

output "polardb_account_status" {
  description = "The status of the PolarDB account"
  value       = alicloud_polardb_account.account.status
}

# PolarDB endpoint address outputs
output "polardb_endpoint_connection_string" {
  description = "The connection string of the PolarDB endpoint address"
  value       = alicloud_polardb_endpoint_address.endpoint_address.connection_string
}

output "polardb_endpoint_ip_address" {
  description = "The IP address of the PolarDB endpoint"
  value       = alicloud_polardb_endpoint_address.endpoint_address.ip_address
}

# PolarDB database outputs
output "polardb_database_name" {
  description = "The name of the PolarDB database"
  value       = alicloud_polardb_database.database.db_name
}

output "polardb_database_status" {
  description = "The status of the PolarDB database"
  value       = alicloud_polardb_database.database.status
}

# OSS bucket outputs
output "oss_bucket_name" {
  description = "The name of the OSS bucket"
  value       = alicloud_oss_bucket.bucket.bucket
}

output "oss_bucket_id" {
  description = "The ID of the OSS bucket"
  value       = alicloud_oss_bucket.bucket.id
}

output "oss_bucket_location" {
  description = "The location of the OSS bucket"
  value       = alicloud_oss_bucket.bucket.location
}

output "oss_bucket_creation_date" {
  description = "The creation date of the OSS bucket"
  value       = alicloud_oss_bucket.bucket.creation_date
}

output "oss_bucket_extranet_endpoint" {
  description = "The extranet endpoint of the OSS bucket"
  value       = alicloud_oss_bucket.bucket.extranet_endpoint
}

output "oss_bucket_intranet_endpoint" {
  description = "The intranet endpoint of the OSS bucket"
  value       = alicloud_oss_bucket.bucket.intranet_endpoint
}