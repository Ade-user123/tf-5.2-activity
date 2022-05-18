provider "azurerm" {
    features {
      key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}
module "resource_group"{
    source = "../modules/ResourceGroup"
}  
module "storage_account" {
  source = "../modules/StorageAccount"
  depends_on =         [module.resource_group]
  // assigning resource group name to "resource_group_name" variable
  resource_group_name = module.resource_group.resource_group_name_output
   // assigning location name to "location" variable
  location = module.resource_group.resource_location_name_output
}
module "service_plan" {
  source = "../modules/ServicePlan"
  depends_on =         [module.resource_group]
  // assigning resource group name to "sresource_group_name" variable
  spresource_group_name =  module.resource_group.resource_group_name_output
  // assigning location name to "splocation" variable
  splocation = module.resource_group.resource_location_name_output
}
module "key_vault" {
  source = "../modules/KeyVault"
  depends_on            =     [module.resource_group]
  // Assigning Resource Group Name to resource_group_name parameter
  resource_group_name   =     module.resource_group.resource_group_name_output
  // Assigning Key Vault location to RG location parameter
  location              =     module.resource_group.resource_location_name_output
}
module "cosmos_db" {
  source = "../modules/CosmosDB"
  depends_on            =     [module.resource_group]
  // Assigning RG Name to Cosmos DB name parameter
  resource_group_name   =     module.resource_group.resource_group_name_output
  // Assigning RG location to Cosmos DB location parameter
  location              =     module.resource_group.resource_location_name_output
}

module "function_app" {
  source = "../modules/FunctionApp"
  depends_on =         [module.storage_account, module.service_plan]
  // assigning resource group name to "fappresource_group_name" variable
  fappresource_group_name = module.resource_group.resource_group_name_output
  // assigning location name to "fapplocation" variable
  fapplocation = module.resource_group.resource_location_name_output
  // assigning stroage account access key name to "storage_account_access_key" variable
  storage_account_access_key = module.storage_account.azurerm_app_storage_primaryacess_output
  // assigning stroage account name to "storage_account_name" variable
  storage_account_name = module.storage_account.azurerm_app_storage_name_output
  // assigning service plan id to "app_service_plan_id" variable
  app_service_plan_id = module.service_plan.azurerm_app_service_plan_id_output
}

module "key_vault_secret" {
  source = "../modules/KVSecret"
  depends_on      =     [module.key_vault, module.cosmos_db, module.function_app]

   // Assigning key vault id to key_vault_id parameter
  key_vault_id    =     module.key_vault.key_vault_id_output
  
   // Assigning Connection Strings and functionapp Id to sensitiveValues list parameter
  sensitiveValues = [module.cosmos_db.connectionsrings_output[0], module.cosmos_db.connectionsrings_output[1],
                      module.cosmos_db.connectionsrings_output[2],module.cosmos_db.connectionsrings_output[3], 
                      module.function_app.functionapp_id_output]
  
}