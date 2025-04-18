##########################
# Virtual Machine Variables
##########################

# Name of the virtual machine (VM)
variable "vm_name" {
  description = "The name of the virtual machine"
}

# The resource group name in which the VM will reside
variable "rg_name" {
  description = "The name of the resource group for the VM"
}

# The location of the resources (e.g., "East US", "West Europe")
variable "location" {
  description = "The location of the resources"
}

# Size of the virtual machine, e.g., "Standard_DS1_v2"
variable "vm_size" {
  description = "The size of the virtual machine"
}

# The admin username to be used for logging into the virtual machine
variable "admin_username" {
  description = "The admin username for the VM"
}

# The network interface (NIC) ID to be associated with the virtual machine
variable "nic_id" {
  description = "The network interface ID for the VM"
}

##########################
# Storage Account Variables
##########################

# The name of the storage account to be created or used
variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

# The access key for the storage account to access storage resources securely
variable "storage_account_access_key" {
  description = "The access key for the storage account"
  type        = string
}

##########################
# App Service Plan Variables
##########################

# Name of the app service plan
variable "app_service_plan_name" {
  description = "The name of the app service plan"
}

# Location of the app service plan (e.g., "East US", "West Europe")
variable "app_service_location" {
  description = "The location of the app service plan"
}

# Name of the Azure function app that will be hosted in the app service plan
variable "function_app_name" {
  description = "The name of the function app in the app service plan"
}
