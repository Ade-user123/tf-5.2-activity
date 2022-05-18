// Creating Function App
resource "azurerm_function_app" "functionapp" {
  name                       = var.fapp_name
  location                   = var.fapplocation
  resource_group_name        = var.fappresource_group_name
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
}