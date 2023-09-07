variable "organization_id" {
  description = "Atlas Organization ID"
  type        = string
}

variable "project_id" {
  description = "Atlas Project ID"
  type        = string
}

variable "search_index_name" {
  description = "Atlas Search Index Name"
  type        = string
}

variable "cluster_name" {
  description = "Atlas Cluster Name"
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
