##########################
# Key Vault Resource
##########################

resource "azurerm_key_vault" "kv" {
  # Basic Information
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.rg_name
  tenant_id                   = var.tenant_id
  
  # SKU and Access Configuration
  sku_name                    = "standard"
  enable_rbac_authorization   = true

  # Soft Delete and Purge Protection
  soft_delete_retention_days  = 90
  purge_protection_enabled    = true

  # Network Access Configuration
  public_network_access_enabled = false  # Disable public access

  # Tags
  tags = {
    environment = "production"
  }
}
