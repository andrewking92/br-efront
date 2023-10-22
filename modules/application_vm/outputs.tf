output "vm_ids" {
  description = "The IDs of the virtual machines"
  value       = { for k, v in azurerm_linux_virtual_machine.test : k => v.id }
}
