resource "mongodbatlas_advanced_cluster" "production_cluster" {
  project_id                    = var.project_id
  name                          = var.atlas_cluster_configs.cluster_name
  mongo_db_major_version        = var.atlas_cluster_configs.mongo_db_major_version
  cluster_type                  = var.atlas_cluster_configs.cluster_type

  disk_size_gb                  = var.atlas_cluster_configs.disk_size_gb

  backup_enabled                = var.atlas_cluster_configs.backup_enabled
  pit_enabled                   = var.atlas_cluster_configs.pit_enabled
  retain_backups_enabled        = var.atlas_cluster_configs.retain_backups_enabled

  replication_specs {
    num_shards = var.atlas_region_configs.num_shards

    dynamic "region_configs" {
      for_each = var.atlas_region_configs.region_configs
      content {
        electable_specs {
          instance_size = region_configs.value.electable_specs.instance_size
          node_count    = region_configs.value.electable_specs.node_count
        }
        analytics_specs {
          instance_size = region_configs.value.analytics_specs.instance_size
          node_count    = region_configs.value.analytics_specs.node_count
        }
        provider_name = region_configs.value.provider_name
        priority      = region_configs.value.priority
        region_name   = region_configs.value.region_name
      }
    }
  }

  advanced_configuration {
    fail_index_key_too_long      = var.atlas_cluster_configs.fail_index_key_too_long
    javascript_enabled           = var.atlas_cluster_configs.javascript_enabled
    minimum_enabled_tls_protocol = var.atlas_cluster_configs.minimum_enabled_tls_protocol
    no_table_scan                = var.atlas_cluster_configs.no_table_scan
    oplog_size_mb                = var.atlas_cluster_configs.oplog_size_mb
  }
}
