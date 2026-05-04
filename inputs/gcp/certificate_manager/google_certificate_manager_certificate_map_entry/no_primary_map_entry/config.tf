terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "sit764-policy-project"
}

resource "google_certificate_manager_certificate" "default" {
  name = "test-certificate-map-entry-certificate"

  managed {
    domains = ["example.com"]
  }
}

resource "google_certificate_manager_certificate_map" "default" {
  name = "test-certificate-map"
}