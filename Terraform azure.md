`provider "azurerm" {
  features {}
  `subscription_id = "your_subscription_id_here"
  client_id       = "your_client_id_here"
  client_secret   = "your_client_secret_here"
  tenant_id       = "your_tenant_id_here"`
  # Other configuration settings for the Azure provider can go here
}

# Define your Azure resources below

resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "West Europe"
}

# Add more resources as needed

# Example Virtual Network
resource "azurerm_virtual_network" "example_network" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  tags = {
    environment = "production"
  }
}

# Example Storage Account
resource "azurerm_storage_account" "example_storage" {
  name                     = "examplestorageaccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "production"
  }
}

**Add more resources based on your infrastructure needs**


terraform init -upgrade
terraform paln
terraform apply -auto-approve
terraform destroy -auto-approve
