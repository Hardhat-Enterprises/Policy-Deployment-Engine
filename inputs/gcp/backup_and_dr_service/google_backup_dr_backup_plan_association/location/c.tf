resource "google_compute_instance" "c1" {
  project      = "my-project-4418-1743628379470"
  name         = "c1"
  machine_type = "n2-standard-2"
  zone         = "australia-southeast1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }
}

resource "google_backup_dr_backup_vault" "c2" {
  project                                    = "my-project-4418-1743628379470"
  location                                   = "australia-southeast1"
  backup_vault_id                            = "c2"
  access_restriction                         = "WITHIN_ORGANIZATION"
  backup_minimum_enforced_retention_duration = "300000s"
}

resource "google_backup_dr_backup_plan" "c3" {
  project        = "my-project-4418-1743628379470"
  location       = "australia-southeast1"
  backup_plan_id = "c3"
  resource_type  = "compute.googleapis.com/Instance"
  backup_vault   = google_backup_dr_backup_vault.c2.id

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

resource "google_backup_dr_backup_plan_association" "c4" {
  project                    = "my-project-4418-1743628379470"
  location                   = "australia-southeast1"
  resource_type              = "compute.googleapis.com/Instance"
  backup_plan_association_id = "c4"
  resource                   = google_compute_instance.c1.id
  backup_plan                = google_backup_dr_backup_plan.c3.id
}
