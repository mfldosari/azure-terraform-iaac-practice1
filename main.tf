##########################
# Resource Group Module
##########################

module "resource_group" {
  source   = "./modules/general/resource_group"
  rg_name  = var.rg_name
  location = var.location
}

##########################
# Database Module
##########################

module "database" {
  source      = "./modules/database"
  rg_name     = var.rg_name
  location    = var.location
  db_username = var.db_username
  db_password = var.db_password
  cosmosdb_account_name = var.cosmosdb_account_name
  cosmosdb_database_name = var.cosmosdb_database_name
  cosmosdb_container_name = var.cosmosdb_container_name
}

##########################
# Storage Module
##########################

module "storage" {
  source                = "./modules/storage"
  rg_name               = var.rg_name
  location              = var.location
  storage_account_name  = var.storage_account_name
}

##########################
# Network Module
##########################

module "network" {
  source          = "./modules/network"
  rg_name         = var.rg_name
  location        = var.location
  address_space   = var.address_space
  subnet_name     = var.subnet_name
  subnet_prefixe  = var.subnet_prefixe
  nic_name        = var.nic_name
  nsg_name        = var.nsg_name
  vnet_name       = var.vnet_name
}

##########################
# Compute (VM and Function App) Module
##########################

module "compute" {
  source                     = "./modules/compute"
  rg_name                    = var.rg_name
  location                   = var.location
  nic_id                     = module.network.nic_id
  admin_username             = var.admin_username
  vm_size                    = var.vm_size
  vm_name                    = var.vm_name
  storage_account_name       = var.storage_account_name
  storage_account_access_key = module.storage.storage_account_access_key
  app_service_location       = var.app_service_location
  app_service_plan_name      = var.app_service_plan_name
  function_app_name          = var.function_app_name
}

##########################
# Security (Key Vault) Module
##########################

module "security" {
  source        = "./modules/security"
  keyvault_name = var.keyvault_name
  location      = var.location
  rg_name       = var.rg_name
  tenant_id     = var.tenant_id
}
