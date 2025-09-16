terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  # credentials = file("D:/ssd-assignment-326906-96b576ee3fe6.json")  
  # project     = "your-gcp-project-id"                        
  # region      = "us-central1"                                
}