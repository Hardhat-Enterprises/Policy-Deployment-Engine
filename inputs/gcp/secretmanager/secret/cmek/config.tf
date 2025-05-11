##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "premium-trainer-456719-j3"
  region  = "australia-southeast1"
}