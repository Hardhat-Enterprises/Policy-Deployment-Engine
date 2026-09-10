terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {}

resource "terraform_data" "non_compliant_location" {
  input = "us-central1"
}