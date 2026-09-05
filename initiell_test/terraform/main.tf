terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.50"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.4"
}

provider "azurerm" {
  features {}
}

# Generate a Random Suffix for Unique Naming
resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

# Get Azure Tenant Information
data "azurerm_client_config" "current" {}

# Create a Resource Group
resource "azurerm_resource_group" "openai_rg" {
  name     = "openai-rg-${random_string.suffix.result}"
  location = "westeurope"
}

# Create an Azure OpenAI Service
resource "azurerm_cognitive_account" "openai" {
  name                          = "openai-${random_string.suffix.result}"
  location                      = azurerm_resource_group.openai_rg.location
  resource_group_name           = azurerm_resource_group.openai_rg.name
  kind                          = "OpenAI"
  sku_name                      = "S0" # Correct SKU for OpenAI Service
  public_network_access_enabled = true
}

# Deploy a Model (e.g., GPT-4 or GPT-3.5 Turbo)
resource "azurerm_cognitive_deployment" "openai_deployment" {
  name                 = "gpt-35-turbo"
  cognitive_account_id = azurerm_cognitive_account.openai.id

  model {
    format  = "OpenAI"
    name    = "gpt-35-turbo"
    version = "0301"
  }

  scale {
    type = "Standard"
  }
}

# Outputs
output "resource_group_name" {
  value = azurerm_resource_group.openai_rg.name
}

output "openai_endpoint" {
  value = azurerm_cognitive_account.openai.endpoint
}

output "openai_model" {
  value = azurerm_cognitive_deployment.openai_deployment.name
}
