##########################
# Resource Group and Networking
##########################

variable "rg_name" {
  description = "The resource group name"
}

variable "location" {
  description = "The location of the resources"
}

variable "vnet_name" {
  description = "The name of the virtual network"
}

variable "address_space" {
  description = "The address space of the virtual network"
}

variable "subnet_name" {
  description = "The name of the subnet"
}

variable "subnet_prefixe" {
  description = "The subnet address prefix"
}

variable "nic_name" {
  description = "The name of the network interface"
}

variable "nsg_name" {
  description = "The name of the network security group"
}

##########################
# Virtual Machine (VM)
##########################

variable "vm_name" {
  description = "The name of the virtual machine"
}

variable "vm_size" {
  description = "Size of the virtual machine"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
}

##########################
# Database Configuration
##########################

variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
}

##########################
# Key Vault Configuration
##########################

variable "keyvault_name" {
  description = "The name of the Azure Key Vault"
  type        = string
}

##########################
# Azure Tenant Information
##########################

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

##########################
# App Service Configuration
##########################

variable "app_service_plan_name" {
  description = "The app service plan name"
}

variable "app_service_location" {
  description = "The location of the app service plan"
}

variable "function_app_name" {
  description = "The name of the function app"
}

##########################
# Storage Account Configuration
##########################

variable "storage_account_name" {
  description = "The name of the storage account"
}
