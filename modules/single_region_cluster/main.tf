# Create Atlas Cluster
resource "mongodbatlas_advanced_cluster" "cluster" {
  project_id          = var.project_id
  name                = var.cluster_name
  cluster_type        = var.cluster_type
  backup_enabled      = var.backup_enabled

  replication_specs {
    num_shards        = var.num_shards

    region_configs {
      electable_specs {
        instance_size = var.instance_size
        node_count    = var.node_count
      }

      provider_name   = var.cloud_provider
      priority        = var.region_1_priority
      region_name     = var.region_1
    }
  }

  advanced_configuration {

  }
}
