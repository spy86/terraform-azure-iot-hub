###########################
# Common vars
###########################
variable "envirioment" {
  description = "Var used for backend container name key"
  type = "string"
}

variable "tag_envirioment" {
  description = "Tag describing the environment"
  type = "string"
}
variable "resource_owner" {
  description = "Tag describing the resource owner"
  type = "string"
}


###########################
# Resource groups vars
###########################

variable "rg_location" {
  description = "Location of resource group"
  default = "West Europe"
  type = "string"
}
variable "rg_name" {
  description = "Name of resource group"
  type = "string"
}


###########################
# Storage vars
###########################
variable "storage_account_name" {
  description = "Name of storage account"
  type = "string"
}
variable "storage_account_tier" {
  description = "Tier of storage account"
  type = "string"
  default = "Standard"
}
variable "storage_account_replication_type" {
  description = "Replication type of storage account"
  type = "string"
  default = "LRS"
}
variable "storage_container_name" {
  description = "Name of storage container"
  type = "string"
}
###########################
# IoT Hub vars
###########################

variable "iothub_name" {
  description = "Name of IoT Hub"
  type = "string"
}

variable "iothub_sku_name" {
  description = "SKU name of IoT Hub"
  type = "string"
}
variable "iothub_sku_capacity" {
  description = "Capacity of IoT Hub"
  type = "number"
}

###########################
# Event Hub vars
###########################
variable "eventhub_namespace_name" {
  description = "Name of eventhub namespace account"
  type = "string"
}
variable "eventhub_namespace_sku" {
  description = "SKU of eventhub namespace account"
  type = "string"
  default = "S1"
}

variable "eventhub_authorization_rule_name" {
  description = "Name authorization rule for eventhub"
  type = "string"
}
