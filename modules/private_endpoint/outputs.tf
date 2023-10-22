output "atlas_private_endpoint_regions" {
  value = [for cfg in mongodbatlas_privatelink_endpoint.test : cfg.region]
  description = "List of application regions for MongoDB Atlas Private Link Endpoints."
}
