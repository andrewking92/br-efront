resource "mongodbatlas_search_index" "test" {
  name                  = var.search_index_name
  project_id            = var.project_id
  cluster_name          = var.cluster_name

  analyzer              = var.analyzer
  database              = var.database_name
  collection_name       = var.collection_name

  mappings_dynamic      = var.mappings_dynamic
  search_analyzer       = var.search_analyzer

  wait_for_index_build_completion = var.wait_for_index_build
}
