terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  project = "dummy-project"
  region  = "us-central1"
}

# Dummy storage bucket (works fine in google provider)
resource "google_storage_bucket" "test_bucket" {
  name     = "ankita-test-bucket-pde"
  location = "US"
}
