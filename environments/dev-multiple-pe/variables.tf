variable "azure_setup_configs" {
  description = "Configuration for Azure regions."
  type = map(object({
    vnet_name             = string
    vnet_address_space    = string
    subnet_name           = string
    subnet_prefixes       = string
    location              = string
    resource_group_name   = string
    tags                  = map(string)
  }))
}

variable "atlas_setup_configs" {
  description = "Configurations for MongoDB Atlas setup"
  type = object({
    organization_id       = string
    project_id            = string
    username              = string
    password              = string
    role_name             = string
  })
}

# variable "atlas_cluster_configs" {
#   description = "Configuration for Atlas cluster."
#   type = map(object({
#     cluster_name          = string
#     backup_enabled        = bool
#     num_shards            = number
#     cloud_provider        = string
#     instance_size         = string
#     cluster_type          = string
#     node_count            = number
#     cloud_provider        = string
#     cluster_regions       = map(string)
#   }))
# }

# variable "atlas_private_endpoint_configs" {
#   description = "Configuration for Atlas private endpoints."
#   type = map(object({
#     application_region    = string
#     endpoint_name         = string
#     request_message       = string
#     is_manual_connection  = bool
#   }))
# }

# variable "atlas_search_index_configs" {
#   description = "Configuration for Atlas search index."
#   type = map(object({
#     search_index_name     = string
#     database_name         = string
#     collection_name       = string
#     mappings_dynamic      = bool
#     wait_for_index_build  = bool
#     analyzer              = string
#     search_analyzer       = string
#   }))
# }
