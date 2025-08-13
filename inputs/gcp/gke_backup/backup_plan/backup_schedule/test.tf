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

resource "google_gke_backup_backup_plan" "test" {
  name = "test-schedule-backup"
  cluster = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  location = "us-central1"
  
  backup_schedule {
    cron_schedule = ""  # Non-compliant - empty schedule!
  }
  
  retention_policy {
    backup_retain_days = 7
  }
}