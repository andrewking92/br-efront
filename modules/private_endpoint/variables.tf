variable "project_id" {
  description = "Atlas Project ID"
  type        = string
}

variable "subnet_ids" {
  description = "Map of Subnet IDs"
  type        = map(string)
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