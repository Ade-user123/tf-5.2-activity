variable "name"{
    
    default = ""
}

variable "key_vault_id" {
    default = ""
}

variable "sensitiveValues" {
    type = list(string)
    default = []
 }


 