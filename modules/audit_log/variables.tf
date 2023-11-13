variable "project_id" {
  description = "Atlas Project ID"
  type        = string
}

variable "atlas_audit_config" {
  description = "Configuration for Atlas Audit Log."
  type = object({
    audit_filter    = string
    audit_authorization_success = bool
    enabled         = bool
  })
}
