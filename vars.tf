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
