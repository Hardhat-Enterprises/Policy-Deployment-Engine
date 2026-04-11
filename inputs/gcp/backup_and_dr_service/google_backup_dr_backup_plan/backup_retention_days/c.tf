resource "google_backup_dr_backup_vault" "c" {
  project  = "PDE"
  location = "australia-southeast1"

  backup_vault_id    = "c"
  access_restriction = "WITHIN_ORGANIZATION"
  backup_minimum_enforced_retention_duration = "100000s"
}

# resource "google_backup_dr_backup_plan" "c" {
#   project        = "my-gcp-project"
#   location       = "australia-southeast1"

#   backup_plan_id = "c"
#   resource_type  = "compute.googleapis.com/Instance"
#   backup_vault   = google_backup_dr_backup_vault.c.name

#   backup_rules {
#     rule_id               = "c"
#     backup_retention_days = 30

#     standard_schedule {
#       time_zone       = "Australia/Sydney"
#       recurrence_type = "DAILY"
#     }
#   }
# }

# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant


resource "google_backup_dr_backup_plan" "c" {
  location       = "australia-southeast1"
  backup_plan_id = "backup-plan-compliant"
  resource_type  = "compute.googleapis.com/Instance"
  backup_vault   = google_backup_dr_backup_vault.c.name

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