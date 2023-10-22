variable "azure_setup_configs" {
  description = "Configuration for Azure regions"
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

variable "azure_vm_configs" {
  description = "Configuration for Azure VMs"
  type = map(object({
    virtual_machine_name  = string
    public_key_file_path  = string
    location              = string
    resource_group_name   = string
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

variable "atlas_cluster_configs" {
  description = "Configurations for MongoDB Atlas cluster setup"
  type = object({
    cluster_name                 = string
    mongo_db_major_version       = string
    cluster_type                 = string
    instance_size                = string
    backup_enabled               = bool
    pit_enabled                  = bool
    retain_backups_enabled       = bool
    disk_size_gb                 = number
    fail_index_key_too_long      = bool
    javascript_enabled           = bool
    minimum_enabled_tls_protocol = string
    no_table_scan                = bool
    oplog_size_mb                = number
  })
}

variable "atlas_region_configs" {
  description = "Region specifications for the MongoDB Atlas Advanced Cluster"
  type = object({
    num_shards = number
    region_configs = list(object({
      electable_specs = object({
        instance_size = string
        node_count    = number
      })
      analytics_specs = object({
        instance_size = string
        node_count    = number
      })
      provider_name = string
      priority      = number
      region_name   = string
    }))
  })
}

variable "atlas_private_endpoint_regions" {
  description = "Configuration for MongoDB Atlas PrivateLink Endpoints"
  type = map(object({
    cloud_provider      = string
    application_region  = string
  }))
}

variable "atlas_private_endpoint_configs_east" {
  description = "Configuration for MongoDB Atlas Private Link Endpoints in East regions."
  
  type = map(object({
    cloud_provider          : string
    resource_group_name     : string
    location                : string
    application_region      : string
    endpoint_name           : string
    request_message         : string
    is_manual_connection    : bool
  }))
}

variable "atlas_private_endpoint_configs_west" {
  description = "Configuration for MongoDB Atlas Private Link Endpoints in West regions."
  
  type = map(object({
    cloud_provider          : string
    resource_group_name     : string
    location                : string
    application_region      : string
    endpoint_name           : string
    request_message         : string
    is_manual_connection    : bool
  }))
}

variable "atlas_search_index_configs" {
  description = "Configuration for Atlas search index"
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
