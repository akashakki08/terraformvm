terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.68.0"
    }
  }
}

provider "azurerm" {
  # Configuration options 
  features {}
}


resource "azurerm_resource_group" "RG" {
  name     = "TestRG1"
  location = "eastus"
  tags = {
    description = "Name of the resource group"
    Name = "Name of resource group"
    }         
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storagename
  resource_group_name      = var.rgname
  location                 = var.location
  account_tier             = var.storagetier
  account_replication_type = var.replicationtype
}

variable "rgname" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

variable "storagename" {
  type    = string
  default = ""
}

variable "storagetier" {
  type    = string
  default = "Standard"
}

variable "replicationtype" {
  type    = string
  default = "LRS"
}

