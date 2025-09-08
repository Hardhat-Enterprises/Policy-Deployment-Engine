##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.1"
    }
  }
}

provider "google" {
  project = "smooth-verve-467716-v1"
  region  = "australia-southeast1"  
}
