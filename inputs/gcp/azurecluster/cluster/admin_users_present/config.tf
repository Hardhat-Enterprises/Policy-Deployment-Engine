terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = "chrome-ability-456100-t1"
  region  = "australia-southeast1"  # or change to any region you're using
}
