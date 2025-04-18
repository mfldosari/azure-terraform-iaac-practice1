##########################
# Resource Group Name
##########################

# The name of the resource group where resources will be created
variable "rg_name" {
  description = "The resource group name"
}

##########################
# Location of Resources
##########################

# The location (Azure region) where resources will be provisioned
variable "location" {
  description = "The location of the resources"
}

##########################
# Database Credentials
##########################

# The username for the database
variable "db_username" {
  description = "The username for the database"
}

# The password for the database
variable "db_password" {
  description = "The password for the database"
}

# Name of the Cosmos DB account
variable "cosmosdb_account_name" {
  description = "Name of the Cosmos DB account"
  type        = string
}

# Name of the Cosmos DB SQL database
variable "cosmosdb_database_name" {
  description = "Name of the Cosmos DB SQL database"
  type        = string
}

# Name of the Cosmos DB SQL container
variable "cosmosdb_container_name" {
  description = "Name of the Cosmos DB SQL container"
  type        = string
}

