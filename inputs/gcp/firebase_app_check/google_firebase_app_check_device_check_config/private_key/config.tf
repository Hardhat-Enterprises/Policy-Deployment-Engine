terraform {
  required_providers {
    google = {
      source = "hashicorp/google-beta"
    }
  }
}

provider "google" {
  project = "test-project"
  region  = "us-central1"
  access_token = "test-token"
}
