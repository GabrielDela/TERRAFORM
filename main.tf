terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.48.0"
    }
  }

  backend "azurerm" {
    
  }
}

provider "azurerm" {
  features {

  }
}

# resource "azurerm_resource_group" "rg" {
#   name     = "rg-gdelahaye${var.environment_suffix}"
#   location = var.location
# }

resource "azurerm_app_service" "web_app" {
  name                = "web-app-${var.project_name}${var.environment_suffix}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.web_app_plan.id

  site_config {}
}

resource "azurerm_app_service_plan" "web_app_plan" {
  name                = "web-app-plan-${var.project_name}${var.environment_suffix}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
