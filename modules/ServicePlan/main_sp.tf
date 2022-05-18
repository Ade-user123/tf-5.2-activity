//  creating Service Plan
resource "azurerm_app_service_plan" "serviceplan" {
  name                = var.sp_name 
  location            = var.splocation 
  resource_group_name = var.spresource_group_name
  sku {
    tier = "Standard"
    size = "S1"
  }
}
