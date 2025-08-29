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

# BAD CASE → Owner write rules
resource "google_firestore_database" "test" {
  project     = "test-project"
  name        = "(default)"
  location_id = "us-central"
  type        = "FIRESTORE_NATIVE"
}
