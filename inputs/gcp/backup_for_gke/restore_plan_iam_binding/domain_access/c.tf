resource "google_gke_backup_restore_plan_iam_binding" "c" {
  name     = "c"
  location = "australia-southeast1"
  project  = "PDE"

  role = "roles/gkebackup.restoreViewer"

  members = [
    "group:sre-team@yourdomain.com",         # SECURE: Specific group
    "group:incident-response@yourdomain.com" # SECURE: Specific group
  ]
}
