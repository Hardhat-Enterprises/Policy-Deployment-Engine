terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 7.11.0"
    }
  }
}

provider "google-beta" {
  project = "pde-test-project"
  region  = "australia-southeast1"
}
