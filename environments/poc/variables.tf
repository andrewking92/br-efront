variable "organization_id" {
  description = "Atlas Organization ID"
  type        = string
}

variable "project_id" {
  description = "Atlas Project ID"
  type        = string
}

variable "username" {
  description = "Atlas Username"
  type        = string
}

variable "password" {
  description = "Atlas Password"
  type        = string
}

variable "role_name" {
  description = "Atlas Database Role"
  type        = string
}

variable "cluster_name" {
  description = "Atlas Cluster Name"
  type        = string
}

variable "backup_enabled" {
  description = "Backup Enabled"
  type        = bool
}

variable "num_shards" {
  description = "Number of Shards"
  type        = number
}

variable "cloud_provider" {
  description = "Cloud Provider"
  type        = string
}

variable "instance_size" {
  description = "Cluster Tier Size"
  type        = string
}

variable "cluster_type" {
  description = "Cluster Type"
  type        = string
}

variable "node_count" {
  description = "Cluster Node Count per Region"
  type        = number
}

variable "region_1" {
  description = "Region 1"
  type        = string
}

variable "region_1_priority" {
  description = "Region 1 Priority"
  type        = number
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "vnet_name" {
  description = "Azure VNet Name"
  type        = string
}

variable "vnet_address_space" {
  description = "Azure VNet Address Space"
  type        = string
}

variable "subnet_name" {
  description = "Azure Subnet Name"
  type        = string
}

variable "subnet_prefixes" {
  description = "Azure Subnet Address Prefixes"
  type        = string
}

variable "application_region" {
  description = "Private Link Endpoint Region"
  type        = string
}

variable "endpoint_name" {
  description = "Private Endpoint Name"
  type        = string
}

variable "request_message" {
  description = "Private Endpoint Service Connection Message"
  type        = string
}

variable "is_manual_connection" {
  description = "Private Endpoint Service Connection Parameter"
  type        = bool
}

variable "search_index_name" {
  description = "Atlas Search Index Name"
  type        = string
}

variable "database_name" {
  description = "Atlas Database Name"
  type        = string
}

variable "collection_name" {
  description = "Atlas Collection Name"
  type        = string
}

variable "mappings_dynamic" {
  description = "Set Dynamic Mappings"
  type        = bool
}

variable "wait_for_index_build" {
  description = "Atlas Search Index Wait for Build Completion"
  type        = bool
}

variable "analyzer" {
  description = "Atlas Search Index Analyzer"
  type        = string
}

variable "search_analyzer" {
  description = "Atlas Search Index Search Analyzer"
  type        = string
}
