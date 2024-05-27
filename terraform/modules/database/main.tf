variable "resource_group_name" {
  description = "The name of the resource group in which to create the database"
  type        = string
}

variable "location" {
  description = "The Azure location where the database should be created"
  type        = string
}

variable "db_name" {
  description = "The name of the PostgreSQL database"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the database"
  type        = map(string)
}

resource "azurerm_postgresql_server" "db" {
  name                = var.db_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name            = "Standard_B_Gen5_1"  # SKU Name

  administrator_login          = "admin"
  administrator_login_password = "Welcome01"
  version                      = "11"
  ssl_enforcement_enabled      = true

  tags = var.tags
}

output "db_fqdn" {
  value = azurerm_postgresql_server.db.fqdn
}
