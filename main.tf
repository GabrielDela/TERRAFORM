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

resource "azurerm_mssql_server" "sql-server" {
  name                         = "sql-server-${var.project_name}${var.environment_suffix}"
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = data.azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.database-login.value
  administrator_login_password = data.azurerm_key_vault_secret.database-password.value
}

resource "azurerm_mssql_database" "sql-db" {
  name           = "RabbitMqDemo"
  server_id      = azurerm_mssql_server.sql-server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
}