terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.37.1"
    }
  }
}

#EQ DIGITAL
provider "newrelic" {
  account_id = var.account_id_EQ_Digital
  api_key    = var.account_api_key_EQ_Digital
  region     = var.account_region_EQ_Digital
}

variable "newrelic_accountid" {
  
}