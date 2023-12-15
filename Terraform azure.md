#Main providers file

```yaml
terraform {
  required_version = ">=0.12"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}
```

# Define your Azure resources below
```yaml
resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "West Europe"
}
```
# Add more resources as needed

# Example Virtual Network
```yaml
resource "azurerm_virtual_network" "example_network" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  tags = {
    environment = "production"
  }
}
```
# Example Storage Account
```yaml
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
```

**Add more resources based on your infrastructure needs**

```bash
terraform init -upgrade
terraform paln
terraform apply -auto-approve
terraform destroy -auto-approve
```
