output "azurerm_app_storage_name_output" {
  value = azurerm_storage_account.storage.name
}
output "azurerm_app_storage_primaryacess_output" {
  value = azurerm_storage_account.storage.primary_access_key
}
