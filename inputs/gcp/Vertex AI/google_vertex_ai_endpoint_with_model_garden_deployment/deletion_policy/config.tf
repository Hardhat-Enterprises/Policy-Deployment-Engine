terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "= 7.37.0"
    }
  }
}

provider "google" {
  project = "example-project"
  region = "australia-southeast1"
  access_token = "offline-plan-placeholder"
}
