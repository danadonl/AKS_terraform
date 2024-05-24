terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-aks"
    storage_account_name = "tfstateakswhs4q"
    container_name       = "tfstate-aks"
    key                  = "terraform-aks.tfstate"
  }
}