variable "organization_id" {
  description = "Atlas Organization ID"
  type        = string
}

variable "project_id" {
  description = "Atlas Project ID"
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

variable "region_2" {
  description = "Region 2"
  type        = string
}

variable "region_2_priority" {
  description = "Region 2 Priority"
  type        = number
}

variable "region_3" {
  description = "Region 3"
  type        = string
}

variable "region_3_priority" {
  description = "Region 3 Priority"
  type        = number
}
