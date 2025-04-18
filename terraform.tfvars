rg_name               = ""  # Name of the resource group
location              = ""  # Azure region (e.g., East US, Canada Central)

vnet_name             = ""  # Name of the virtual network
subnet_name           = ""  # Name of the subnet
address_space         = []  # CIDR block for the virtual network (e.g., ["10.0.0.0/16"])
subnet_prefixe        = []  # CIDR block for the subnet (e.g., ["10.0.1.0/24"])

nsg_name              = ""  # Name of the network security group
nic_name              = ""  # Name of the network interface

vm_name               = ""  # Virtual machine name
vm_size               = ""  # VM size (e.g., Standard_B1s)
admin_username        = ""  # Admin username for VM

db_username           = ""  # PostgreSQL admin username
db_password           = ""  # PostgreSQL admin password

keyvault_name         = ""  # Name of the Azure Key Vault
tenant_id             = ""  # Azure Active Directory tenant ID
subscription_id       = ""  # Azure subscription ID

app_service_plan_name = ""  # Name of the Azure App Service Plan
app_service_location  = ""  # Region for App Service and Function App
function_app_name     = ""  # Azure Function App name

storage_account_name  = ""  # Azure Storage Account name

cosmosdb_account_name   = ""  # Cosmos DB account name
cosmosdb_database_name  = ""  # Cosmos DB database name
cosmosdb_container_name = ""  # Cosmos DB container name
