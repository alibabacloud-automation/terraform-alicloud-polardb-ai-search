# ------------------------------------------------------------------------------
# Outputs for the complete example
#
# This file defines the outputs that will be displayed after the example
# is successfully deployed, providing key information about the created resources
# ------------------------------------------------------------------------------

# Module outputs - VPC
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.polardb_ai_search.vpc_id
}

output "vpc_name" {
  description = "The name of the created VPC"
  value       = module.polardb_ai_search.vpc_name
}

# Module outputs - VSwitch
output "vswitch_id" {
  description = "The ID of the created VSwitch"
  value       = module.polardb_ai_search.vswitch_id
}

output "vswitch_zone_id" {
  description = "The availability zone of the VSwitch"
  value       = module.polardb_ai_search.vswitch_zone_id
}

# Module outputs - PolarDB Cluster
output "polardb_cluster_id" {
  description = "The ID of the PolarDB cluster"
  value       = module.polardb_ai_search.polardb_cluster_id
}

output "polardb_cluster_connection_string" {
  description = "The connection string of the PolarDB cluster"
  value       = module.polardb_ai_search.polardb_cluster_connection_string
}

output "polardb_cluster_port" {
  description = "The port of the PolarDB cluster"
  value       = module.polardb_ai_search.polardb_cluster_port
}

# Module outputs - PolarDB Account
output "polardb_account_name" {
  description = "The name of the PolarDB account"
  value       = module.polardb_ai_search.polardb_account_name
}

# Module outputs - PolarDB Endpoint
output "polardb_endpoint_connection_string" {
  description = "The connection string of the PolarDB endpoint"
  value       = module.polardb_ai_search.polardb_endpoint_connection_string
}

output "polardb_endpoint_ip_address" {
  description = "The IP address of the PolarDB endpoint"
  value       = module.polardb_ai_search.polardb_endpoint_ip_address
}

# Module outputs - PolarDB Database
output "polardb_database_name" {
  description = "The name of the PolarDB database"
  value       = module.polardb_ai_search.polardb_database_name
}

# Module outputs - OSS Bucket
output "oss_bucket_name" {
  description = "The name of the OSS bucket"
  value       = module.polardb_ai_search.oss_bucket_name
}

output "oss_bucket_extranet_endpoint" {
  description = "The extranet endpoint of the OSS bucket"
  value       = module.polardb_ai_search.oss_bucket_extranet_endpoint
}

output "oss_bucket_intranet_endpoint" {
  description = "The intranet endpoint of the OSS bucket"
  value       = module.polardb_ai_search.oss_bucket_intranet_endpoint
}

# Connection information summary
output "connection_info" {
  description = "Summary of connection information"
  value = {
    polardb_cluster_connection = "${module.polardb_ai_search.polardb_endpoint_connection_string}:${module.polardb_ai_search.polardb_cluster_port}"
    polardb_database_name      = module.polardb_ai_search.polardb_database_name
    polardb_account_name       = module.polardb_ai_search.polardb_account_name
    oss_bucket_name            = module.polardb_ai_search.oss_bucket_name
  }
}