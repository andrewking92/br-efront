variable "organization_id" {
  description = "Atlas Organization ID"
  type        = string
}

variable "project_id" {
  description = "Atlas Project ID"
  type        = string
}

variable "cloud_provider" {
  description = "Cloud Provider"
  type        = string
}

variable "application_region" {
  description = "Private Link Endpoint Region"
  type        = string
}

variable "endpoint_name" {
  description = "Private Endpoint Name"
  type        = string
}

variable "request_message" {
  description = "Private Endpoint Service Connection Message"
  type        = string
}

variable "is_manual_connection" {
  description = "Private Endpoint Service Connection Parameter"
  type        = bool
}

variable "location" {
  description = "Azure Resource Group Location"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "subnet_id" {
  description = "Azure Subnet ID"
  type        = string
}