##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {}

module "test" {
  source = "../.."

  cidr = var.cidr
}

variable "cidr" {}
