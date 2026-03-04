# ------------------------------------------------------------------------------
# Variables for the complete example
#
# This file defines the input variables required for the complete example
# Users can customize these values based on their requirements
# ------------------------------------------------------------------------------

variable "region" {
  type        = string
  description = "The Alibaba Cloud region to deploy resources"
  default     = "cn-hangzhou"
}

variable "name_prefix" {
  type        = string
  description = "Name prefix for all resources"
  default     = "polardb-ai-search-example"
}

variable "db_account_name" {
  type        = string
  description = "Database account name for PolarDB"
  default     = "polar_ai"

  validation {
    condition     = can(regex("^[a-z][a-z0-9_]{0,30}[a-z0-9]$", var.db_account_name))
    error_message = "The db_account_name must start with a letter, end with a letter or number, contain only lowercase letters, numbers and underscores, and be at most 32 characters long."
  }
}

variable "db_password" {
  type        = string
  description = "Database password for PolarDB account"
  sensitive   = true
  default     = "Example123!@#"

  validation {
    condition     = can(regex("^[0-9A-Za-z_!@#$%^&*()_+\\-=\\+]+$", var.db_password)) && length(var.db_password) >= 8 && length(var.db_password) <= 30
    error_message = "The db_password must be 8-30 characters long and contain at least three of the following: uppercase letters, lowercase letters, numbers, and special characters (!@#$%^&*()_+-=)."
  }
}

variable "db_name" {
  type        = string
  description = "Database name for PolarDB"
  default     = "ai_search_db"

  validation {
    condition     = can(regex("^[a-z][a-z0-9_-]{0,62}[a-z0-9]$", var.db_name))
    error_message = "The db_name must start with a letter, end with a letter or number, contain only lowercase letters, numbers, hyphens and underscores, and be at most 64 characters long."
  }
}