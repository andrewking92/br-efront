output "organization_id" {
  description = "Atlas Organization ID"
  value       = data.mongodbatlas_organization.test.id
}

output "project_id" {
  description = "Atlas Project ID"
  value       = mongodbatlas_project.test.id
}