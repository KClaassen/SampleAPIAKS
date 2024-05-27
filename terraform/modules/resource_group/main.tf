variable "name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location where the resource group should be created"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resource group"
  type        = map(string)
}

resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
  tags     = var.tags
}

output "name" {
  value = azurerm_resource_group.rg.name
}
