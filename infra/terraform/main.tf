provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "aks-lab-rg"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-lab-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "akslab"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}
