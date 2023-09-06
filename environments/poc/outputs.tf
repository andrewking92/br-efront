output "mongodbatlas_organization_test" {
    value = module.atlas_setup.mongodbatlas_organization_test
}

output "mongodbatlas_project_test" {
    value = module.atlas_setup.mongodbatlas_project_test
}

output "azurerm_resource_group_test" {
    value = module.azure_setup.azurerm_resource_group_test_id
}

# output "mongodbatlas_cluster_connection_string_srv" {
#     value = module.private_endpoint.connection_string_srv
# }
