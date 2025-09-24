##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "gdce-dev"              
  region  = "australia-southeast1"  
}