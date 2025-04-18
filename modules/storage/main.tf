##########################
# Storage Account Configuration
##########################

# Storage Account Resource
resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

# Storage Container Resource
resource "azurerm_storage_container" "this" {
  name                  = "chatbot"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"

  depends_on = [azurerm_storage_account.this]
}

##########################
# Time-based Offset
##########################

# Time Offset Resource (7-day expiry)
resource "time_offset" "expiry" {
  offset_days = 7
}

##########################
# SAS Token Configuration
##########################

# Blob SAS Token Resource
data "azurerm_storage_account_blob_container_sas" "example" {
  connection_string = azurerm_storage_account.this.primary_connection_string
  container_name    = azurerm_storage_container.this.name
  https_only        = true

  ip_address = "168.1.5.65"  # Replace with actual IP or parameterize

  start  = timestamp()  # Start time for the SAS token
  expiry = time_offset.expiry.rfc3339  # Expiry set to 7 days from now

  # Permissions granted by SAS token
  permissions {
    read   = true
    add    = true
    create = true
    write  = true
    delete = true
    list   = true
  }

  # Additional metadata and settings for the SAS token
  cache_control       = "max-age=5"
  content_disposition = "inline"
  content_encoding    = "deflate"
  content_language    = "en-US"
  content_type        = "application/json"

  depends_on = [
    azurerm_storage_account.this,
    azurerm_storage_container.this
  ]
}
