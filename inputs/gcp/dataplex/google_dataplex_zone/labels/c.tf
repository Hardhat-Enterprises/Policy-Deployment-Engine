terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "dummy-project"
  region  = "us-central1"
}

resource "google_dataplex_zone" "ok" {
  name     = "zone-ok"
  lake     = "test-lake"
  location = "us-central1"
  type     = "RAW"

  discovery_spec {
    enabled = true
  }

  resource_spec {
    location_type = "SINGLE_REGION"
  }

  labels = {
    owner = "pde"
  }
}
