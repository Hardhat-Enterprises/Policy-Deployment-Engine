terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
    }
  }
}

provider "google-beta" {
  project = "focus-dragon-406513-m2"
  region  = "us-central1"
}
