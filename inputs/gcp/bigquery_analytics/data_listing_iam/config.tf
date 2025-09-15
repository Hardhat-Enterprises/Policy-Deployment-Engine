terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "focus-dragon-406513-m2"
  region  = "us-central1"
}
