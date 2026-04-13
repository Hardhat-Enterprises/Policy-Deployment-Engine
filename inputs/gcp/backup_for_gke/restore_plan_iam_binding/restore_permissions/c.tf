resource "google_gke_backup_restore_plan_iam_binding" "c" {
  name     = "c"
  location = "australia-southeast1"
  project  = "PDE"

  role = "roles/gkebackup.viewer" # SECURE: Read-only access

  members = [
    "serviceAccount:audit-sa@fluent-coder-468700-h4.iam.gserviceaccount.com"
  ]
}
