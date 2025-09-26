terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.15.0"
    }
  }
}

provider "google" {}