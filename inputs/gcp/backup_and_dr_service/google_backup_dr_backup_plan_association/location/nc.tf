# Backup plan association with non-approved location
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_backup_dr_backup_vault" "nc" {
  project  = "PDE"
  location = "us-central1"

  backup_vault_id                           = "nc"
  access_restriction                        = "WITHIN_ORGANIZATION"
  backup_minimum_enforced_retention_duration = "100000s"
}

resource "google_backup_dr_backup_plan" "nc" {
  location       = "us-central1"
  backup_plan_id = "backup-plan-noncompliant"
  resource_type  = "compute.googleapis.com/Instance"
  backup_vault   = google_backup_dr_backup_vault.nc.name

  backup_rules {
    rule_id               = "daily-rule"
    backup_retention_days = 30

    standard_schedule {
      recurrence_type = "DAILY"
      time_zone       = "Australia/Melbourne"

      backup_window {
        start_hour_of_day = 1
        end_hour_of_day   = 3
      }
    }
  }
}

resource "google_compute_instance" "nc" {
  name         = "instance-nc"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

resource "google_backup_dr_backup_plan_association" "nc" {
  location                   = "us-central1"
  backup_plan_association_id = "association-nc"
  resource                   = google_compute_instance.nc.id
  resource_type              = "compute.googleapis.com/Instance"
  backup_plan                = google_backup_dr_backup_plan.nc.name
}