terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.44.1"
    }
  }
}

resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate-aks"
  location = "eastus"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstateaks${random_string.resource_code.result}"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "demo"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate-aks"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}