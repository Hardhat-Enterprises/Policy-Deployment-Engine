terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 5.0.0"
    }
  }
}

provider "google-beta" {
  project = "focus-dragon-406513-m2"
  region  = "us-central1"
}
