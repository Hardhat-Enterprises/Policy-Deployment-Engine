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
  zone    = "us-central1-c"
}

# Compliant resource - 30 days retention
resource "google_gke_backup_backup_plan" "compliant" {
  name = "compliant-retention-backup"
  cluster = "projects/fluent-coder-468700-h4/locations/us-central1-c/clusters/test-cluster"
  location = "us-central1-c"
  
  retention_policy {
    backup_retain_days = 30  # Compliant - 30 days
  }
}

# Non-compliant resource - change this to 3 days
resource "google_gke_backup_backup_plan" "non_compliant" {
  name = "non-compliant-retention-backup"
  cluster = "projects/fluent-coder-468700-h4/locations/us-central1-c/clusters/test-cluster"
  location = "us-central1-c"
  
  retention_policy {
    backup_retain_days = 3  # This should trigger a violation
  }
}