# TERRAFORM (AZURE IoT HUB)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
## Providers      

| Name | Version |
|------|---------|
| azurem | latest |  


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| envirioment | Var used for backend container name key | `string` | n/a | yes |
| eventhub\_authorization\_rule\_name | Name authorization rule for eventhub | `string` | n/a | yes |
| eventhub\_namespace\_name | Name of eventhub namespace account | `string` | n/a | yes |
| eventhub\_namespace\_sku | SKU of eventhub namespace account | `string` | `"S1"` | no |
| iothub\_name | Name of IoT Hub | `string` | n/a | yes |
| iothub\_sku\_capacity | Capacity of IoT Hub | `number` | n/a | yes |
| iothub\_sku\_name | SKU name of IoT Hub | `string` | n/a | yes |
| resource\_owner | Tag describing the resource owner | `string` | n/a | yes |
| rg\_location | Location of resource group | `string` | `"West Europe"` | no |
| rg\_name | Name of resource group | `string` | n/a | yes |
| storage\_account\_name | Name of storage account | `string` | n/a | yes |
| storage\_account\_replication\_type | Replication type of storage account | `string` | `"LRS"` | no |
| storage\_account\_tier | Tier of storage account | `string` | `"Standard"` | no |
| storage\_container\_name | Name of storage container | `string` | n/a | yes |
| tag\_envirioment | Tag describing the environment | `string` | n/a | yes |


### Terraform apply

```
terraform plan -var-file="env/dev.tfvars"
```

### Terraform plan
```
terraform apply -var-file="env/dev.tfvars"
```