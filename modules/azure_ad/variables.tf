variable "azure_region_configs" {
  description = "Configuration for Azure regions."
  type = map(object({
    vnet_name           = string
    vnet_address_space  = string
    subnet_name         = string
    subnet_prefixes     = string
    location            = string
    resource_group_name = string
    tags                = map(string)
  }))
}
