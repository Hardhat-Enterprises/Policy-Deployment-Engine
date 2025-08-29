terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
}

provider "google" {
  project     = "demo-project"
  region      = "us-central1"
  credentials = file("dummy.json") # <== create a fake JSON file
}

# Dummy resource just to get a plan
resource "google_storage_bucket" "dummy" {
  name     = "demo-dummy-bucket-123456"
  location = "US"
}
