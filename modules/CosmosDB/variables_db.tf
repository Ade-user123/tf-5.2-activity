
variable "resource_group_name"{
    
    default = ""
}

variable "location" {
    default = ""
}


variable "offertype" {
    default = "Standard"
}

variable "consistency_level" {
    default = "BoundedStaleness"
}

variable "failover_location" {
    default = "australiacentral2"
}


variable "cosmodb_name" {
    default = "rg-cosmo-tf5-db"
}