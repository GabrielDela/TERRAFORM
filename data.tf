data "azurerm_resource_group" "rg" {
  name = "rg-${var.project_name}${var.environment_suffix}"
}