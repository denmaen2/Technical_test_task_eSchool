terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~>2.0"
    }
  }
}

locals {
  sp_credentials = jsondecode(file("service-principal-credentials.json"))
}

provider "azurerm" {
  features {}
  client_id       = local.sp_credentials.client_id
  client_secret   = local.sp_credentials.client_secret
  tenant_id       = local.sp_credentials.tenant_id
  subscription_id = local.sp_credentials.subscription_id
}
