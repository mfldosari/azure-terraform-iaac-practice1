##########################
# Linux Virtual Machine (VM) Resource
##########################

# Define an Azure Linux Virtual Machine with the provided configuration
resource "azurerm_linux_virtual_machine" "this" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [
    var.nic_id,
  ]

  # Admin SSH key for secure access to the VM
  admin_ssh_key {
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub") 
  }

  # OS disk configuration (Standard_LRS for redundant storage)
  os_disk {
    caching              = "ReadWrite" 
    storage_account_type = "Standard_LRS"  
  }

  # Source image configuration (Ubuntu 22.04 LTS)
  source_image_reference {
    publisher = "Canonical"  
    offer     = "0001-com-ubuntu-server-jammy" 
    sku       = "22_04-lts" 
    version   = "latest"  
  }

  # Enable managed identity for the VM
 /*  identity {
    type = "SystemAssigned"  
  } */
}

##########################
# Azure App Service Plan
##########################

# Define an Azure App Service Plan to host the function app
resource "azurerm_app_service_plan" "this" {
  name                = var.app_service_plan_name
  location            = var.app_service_location
  resource_group_name = var.rg_name
  kind                = "Linux"
  reserved            = true

  # SKU configuration (Dynamic pricing tier for Azure Functions)
  sku {
    tier = "Dynamic"  
    size = "Y1"      
  }

  # Ignore changes to the kind attribute for consistency in the Terraform state
  lifecycle {
    ignore_changes = [
      kind
    ]
  }
}

##########################
# Azure Function App
##########################

# Define an Azure Function App to be hosted on the app service plan
resource "azurerm_function_app" "this" {
  name                       = var.function_app_name
  location                   = var.app_service_location
  resource_group_name        = var.rg_name
  app_service_plan_id        = azurerm_app_service_plan.this.id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  os_type                    = "linux"
  version                    = "~4" 

  # Application settings for the function app
  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"  
  }

  # Site configuration (set the runtime version to Python 3.9)
  site_config {
    linux_fx_version = "python|3.9" 
  }
}
