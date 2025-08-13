terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = "fluent-coder-468700-h4"
  region  = "us-central1"
}

# Compliant resource
resource "google_gke_backup_backup_plan" "compliant" {
  name = "compliant-deactivated-backup"
  cluster = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  location = "us-central1"
  
  deactivated = false  # Compliant - active
  
  retention_policy {
    backup_retain_days = 7
  }
}

# Non-compliant resource
resource "google_gke_backup_backup_plan" "non_compliant" {
  name = "non-compliant-deactivated-backup"
  cluster = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  location = "us-central1"
  
  deactivated = true  # Non-compliant - deactivated!
  
  retention_policy {
    backup_retain_days = 7
  }
}