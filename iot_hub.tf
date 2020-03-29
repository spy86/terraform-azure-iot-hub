resource "azurerm_eventhub_namespace" "exampleeventhubnamespace" {
  name                = "${var.eventhub_namespace_name}"
  resource_group_name = "${azurem_resource_group.rg.name}"
  location            = "${azurem_resource_group.rg.location}"
  sku                 = "${var.eventhub_namespace_sku}"
}

resource "azurerm_eventhub" "exampleeventhub" {
  name                = "${var.eventhub_namespace_name}"
  resource_group_name = "${azurem_resource_group.rg.name}"
  namespace_name      = "${azurerm_eventhub_namespace.exampleeventhubnamespace.name}"
  partition_count     = 2
  message_retention   = 1
}

resource "azurerm_eventhub_authorization_rule" "exampleauthorizationrule" {
  resource_group_name = "${azurem_resource_group.rg.name}"
  namespace_name      = "${azurerm_eventhub_namespace.exampleeventhubnamespace.name}"
  eventhub_name       = "${azurerm_eventhub.exampleeventhub.name}"
  name                = "${var.eventhub_authorization_rule_name}"
  send                = true
}

resource "azurerm_iothub" "exampleiothub" {
  name                = "${var.iothub_name}"
  resource_group_name = "${azurem_resource_group.rg.name}"
  location            = "${azurem_resource_group.rg.location}"

  sku {
    name     = "${var.iothub_sku_name}"
    capacity = "${var.iothub_sku_capacity}"
  }

  endpoint {
    type                       = "AzureIotHub.StorageContainer"
    connection_string          = "${azurerm_storage_account.examplestorage.primary_blob_connection_string}"
    name                       = "export"
    batch_frequency_in_seconds = 60
    max_chunk_size_in_bytes    = 10485760
    container_name             = "${azurerm_storage_container.examplestoragecontainer.name}"
    encoding                   = "Avro"
    file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
  }

  endpoint {
    type              = "AzureIotHub.EventHub"
    connection_string = "${azurerm_eventhub_authorization_rule.exampleauthorizationrule.primary_connection_string}"
    name              = "EXPORT_2"
  }

  route {
    name           = "EXPORT"
    source         = "DeviceMessages"
    condition      = "true"
    endpoint_names = ["export"]
    enabled        = true
  }

  route {
    name           = "EXPORT_2"
    source         = "DeviceMessages"
    condition      = "true"
    endpoint_names = ["EXPORT_2"]
    enabled        = true
  }

    tags = {
      resource-owner = "${var.resource_owner}"
      environment = "${var.envirioment}"
  }
}