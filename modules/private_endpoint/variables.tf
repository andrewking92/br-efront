variable "project_id" {
  description = "Atlas Project ID"
  type        = string
}

# variable "regional_endpoint_configs" {
#   description = "Configuration for Atlas private endpoints across different regions"

#   type = map(object({
#     cloud_provider          = string
#     resource_group_name     = string
#     location                = string
#     application_region      = string
#     endpoint_name           = string
#     request_message         = string
#     is_manual_connection    = bool
#   }))
# }