terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "6.32.0"
    }
  }
}

provider "google-beta" {}