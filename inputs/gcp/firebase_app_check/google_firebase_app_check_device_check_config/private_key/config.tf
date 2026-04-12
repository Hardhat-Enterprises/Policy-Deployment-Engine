terraform {
  required_providers {
    google = {
      source = "hashicorp/google-beta"
    }
  }
}

provider "google" {
  project = "test-project"
  region  = "australia-southeast1"
  access_token = "test-token"
}
