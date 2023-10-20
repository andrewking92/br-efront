variable "project_id" {
  description = "The Project ID from MongoDB Atlas"
  type        = string
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