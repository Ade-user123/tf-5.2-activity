resource "azurerm_key_vault_secret" "key_vault_secret" {
  count        = length(var.sensitiveValues)
  name         = "kvs-${tostring(count.index)}"
  value        = var.sensitiveValues[count.index]
  key_vault_id = var.key_vault_id
 
  }