resource "google_gke_backup_restore_plan_iam_binding" "c" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "serviceAccount:restore-sa@fluent-coder-468700-h4.iam.gserviceaccount.com",
    "group:sre-oncall@yourdomain.com"  # SECURE: Multiple members for accountability
  ]
}
