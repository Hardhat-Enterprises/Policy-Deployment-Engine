##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "gdce-dev"              # Project ID
  region  = "australia-southeast1"  # GDCE region
}