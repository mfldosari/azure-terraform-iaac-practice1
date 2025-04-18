##########################
# PostgreSQL Flexible Server
##########################

# Provision a PostgreSQL flexible server with version 13 and custom configurations
resource "azurerm_postgresql_flexible_server" "this" {
  name                   = "chatbot-database-sda-weclouddata"  
  resource_group_name    = var.rg_name                        
  location               = var.location                        
  version                = "13"                               
  administrator_login    = var.db_username                     
  administrator_password = var.db_password                     
  storage_mb             = 32768                               
  sku_name               = "B_Standard_B1ms"                  

  # Specify the availability zone during server creation
  zone = "1"  
}

##########################
# PostgreSQL Database
##########################

# Create a PostgreSQL database inside the flexible server
resource "azurerm_postgresql_flexible_server_database" "this" {
  name      = "postgres"                       
  server_id = azurerm_postgresql_flexible_server.this.id  
  collation = "en_US.utf8"                      
  charset   = "UTF8"                            
  
  # Prevent accidental destruction of the database to ensure data safety
  lifecycle {
    prevent_destroy = true  
  }
}


##########################
#  Cosmos Database
##########################

# Cosmos DB account using Core (SQL) API
resource "azurerm_cosmosdb_account" "this" {
  name                = var.cosmosdb_account_name
  location            = var.location
  resource_group_name = var.rg_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  capabilities {
    name = "EnableServerless"
  }


  backup {
    type                = "Periodic"
    interval_in_minutes = 240
    retention_in_hours  = 8
  }

  tags = {
    environment = "staging"
  }
}

# Cosmos DB SQL database
resource "azurerm_cosmosdb_sql_database" "this" {
  name                = var.cosmosdb_database_name
  resource_group_name = var.rg_name
  account_name        = azurerm_cosmosdb_account.this.name
  throughput          = 400
}

# Cosmos DB Account (Provisioned)
resource "azurerm_cosmosdb_account" "this" {
  name                = var.cosmosdb_account_name
  location            = var.location
  resource_group_name = var.rg_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }

  capabilities {
    name = "EnableServerless" 
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

