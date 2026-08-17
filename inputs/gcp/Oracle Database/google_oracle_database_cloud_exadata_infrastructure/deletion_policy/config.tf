terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.37.0"
    }
  }
}

provider "google" {}
