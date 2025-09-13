terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "dummy-project"          # 👈 fake project ID, just for plan generation
  region  = "australia-southeast1"
}
