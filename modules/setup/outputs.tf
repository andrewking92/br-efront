output "mongodbatlas_organization_test" {
  description = "Atlas Organization ID"
  value       = data.mongodbatlas_organization.test.id
}

output "mongodbatlas_project_test" {
  description = "Atlas Project ID"
  value       = data.mongodbatlas_project.test.id
}