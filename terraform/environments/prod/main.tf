# Declare missing variables
variable "tags" {
  description = "Tags to be applied to Azure resources"
  type        = map(string)
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
}

variable "azure_subscription_id" {
  description = "The Azure subscription ID"
  type        = string
  default     = "your_subscription_id"
}

variable "azure_tenant_id" {
  description = "The Azure tenant ID"
  type        = string
  default     = "your_tenant_id"
}

variable "azure_client_id" {
  description = "The Azure client ID (service principal)"
  type        = string
  default     = "your_client_id"
}

variable "azure_client_secret" {
  description = "The Azure client secret (service principal)"
  type        = string
  default     = "your_client_secret"
}

# Define Azure provider and backend configurations
provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
}

terraform {
  required_version = ">= 1.0"
  backend "azurerm" {
    resource_group_name  = "my-terraform-state-rg"
    storage_account_name = "myterraformstate"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

# Define modules
module "resource_group" {
  source     = "../../modules/resource_group"
  name       = "prod-rg"
  location   = "eastus"
  tags       = var.tags
}

module "aks" {
  source              = "../../modules/aks"
  resource_group_name = module.resource_group.name
  location            = "eastus"
  node_count          = var.node_count
  tags                = var.tags
}

module "database" {
  source              = "../../modules/database"
  resource_group_name = module.resource_group.name
  location            = "eastus"
  db_name             = "proddb"
  tags                = var.tags
}
