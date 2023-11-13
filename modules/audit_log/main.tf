resource "mongodbatlas_auditing" "test" {
  project_id                  = var.project_id
  audit_filter                = var.atlas_audit_config.audit_filter
  audit_authorization_success = var.atlas_audit_config.audit_authorization_success
  enabled                     = var.atlas_audit_config.enabled
}