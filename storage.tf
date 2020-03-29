resource "azurerm_storage_account" "examplestorage" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${azurem_resource_group.rg.name}"
  location                 = "${azurem_resource_group.rg.location}"
  account_tier             = "${var.storage_account_tier}"
  account_replication_type = "${var.storage_account_replication_typedd}"

    tags = {
      resource-owner = "${var.resource_owner}"
      environment = "${var.envirioment}"
  }
}

resource "azurerm_storage_container" "examplestoragecontainer" {
  name                  = "${var.storage_container_name}"
  storage_account_name  = "${azurerm_storage_account.examplestorage.name}"
  container_access_type = "private"
}