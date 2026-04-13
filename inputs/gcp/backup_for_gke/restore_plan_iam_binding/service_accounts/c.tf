resource "google_gke_backup_restore_plan_iam_binding" "c" {
  name     = "c"
  location = "australia-southeast1"
  project  = "PDE"

  role = "roles/gkebackup.restoreAdmin"

  members = [
    "serviceAccount:restore-automation@fluent-coder-468700-h4.iam.gserviceaccount.com", # SECURE: Same project SA
    "serviceAccount:dr-restore@fluent-coder-468700-h4.iam.gserviceaccount.com"          # SECURE: Allowed project SA
  ]
}
