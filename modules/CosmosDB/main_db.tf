resource "azurerm_cosmosdb_account" "db" {
  name                = var.cosmodb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offertype


  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
  
}