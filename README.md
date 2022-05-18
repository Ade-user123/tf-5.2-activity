
# Creation of RG, Storage Account, Service plan, Key Vault, Cosmos DB, FunctionApp and Key Vault secret using Modules
# Introduction
# This is the terraform script to create RG, Storage Account, Service plan, Key Vault, Cosmos DB, FunctionApp and Key Vault secret using Modules.
# passing 4 cosmos DB connection strings, FunctionApp ID & key vault ID to key vault secret and creating 5 key vault secrets.
# Folder structure
# tf_main -> which has main terraform scripts
# variables -> is having all the variables and default values
# outputs.tf -> is having all the values that are writing outputs
# README.md -> is containing all the help
# Pre-requisites
# 1. Need to have Azure service principal -> with contributor role is assigned
# 2. Set below envirnment variables
# ARM_TENANT_ID
# ARM_SUBSCRIPTION_ID
# ARM_CLIENT_ID
# ARM_CLIENT_SECRET
# Terraform commands
# - Run all the terraform commands from tf_main folder
# - No need to import/reference. with in the folder, terraform understands and reads all the .tf files
# ---------
# Terraform Init
# Terraform validate
# Terraform plan
# Terraform apply
# Terraform destroy
---------