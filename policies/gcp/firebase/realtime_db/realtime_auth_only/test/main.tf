terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  project = "test-project"
}

# BAD CASE → Public bucket
resource "google_storage_bucket" "public_bucket" {
  name          = "public-bucket"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = false
}
