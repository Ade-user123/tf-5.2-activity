// variable declaration for storage account
variable "location" {
    default = ""
}
variable "account_tier" {
  default = "Standard"
}
variable "account_replication_type" {
    default = "GRS"
}
variable "tags" {
    description = "Tags for the resources"
    type = map(string) 
    default ={
        "environment" = "dev"
        "source" = "terraform"
}
}
variable "resource_group_name"{
    
    default = ""
}
variable "storage_name"{
    
    default = "adedevopsfappstorage"
}