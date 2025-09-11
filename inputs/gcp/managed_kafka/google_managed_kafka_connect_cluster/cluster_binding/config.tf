##### DO NOT EDIT ######

terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      
 
    }
    google = {
      source  = "hashicorp/google"
      
    }
  }
}

provider "google-beta" {}
provider "google" {
  
}