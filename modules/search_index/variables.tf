variable "project_id" {
  description = "Atlas Project ID"
  type        = string
}

variable "atlas_search_index_configs" {
  description = "Configuration for Atlas search index."
  type = object({
    search_index_name     = string
    cluster_name          = string
    database_name         = string
    collection_name       = string
    mappings_dynamic      = bool
    wait_for_index_build  = bool
    analyzer              = string
    search_analyzer       = string
  })
}
