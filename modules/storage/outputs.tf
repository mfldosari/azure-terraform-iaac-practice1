##########################
# Storage Account Outputs
##########################

output "sas_url_query_string" {
  description = "The SAS URL query string for the storage container"
  value       = data.azurerm_storage_account_blob_container_sas.example.sas
  sensitive   = true
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.this.name
}

output "storage_account_access_key" {
  description = "The primary access key for the storage account"
  value       = azurerm_storage_account.this.primary_access_key
  sensitive   = true
}
