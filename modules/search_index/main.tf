resource "mongodbatlas_search_index" "test" {
  project_id            = var.project_id
  name                  = var.atlas_search_index_configs.search_index_name
  cluster_name          = var.atlas_search_index_configs.cluster_name

  analyzer              = var.atlas_search_index_configs.analyzer
  database              = var.atlas_search_index_configs.database_name
  collection_name       = var.atlas_search_index_configs.collection_name

  mappings_dynamic      = var.atlas_search_index_configs.mappings_dynamic
  search_analyzer       = var.atlas_search_index_configs.search_analyzer

  wait_for_index_build_completion = var.atlas_search_index_configs.wait_for_index_build
}
