resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  name     = "nc"
  location = "australia-southeast1"
  project  = "PDE"

  role = "roles/gkebackup.restoreAdmin"

  members = [
    "allUsers",             # CRITICAL SECURITY RISK: Public restore access!
    "allAuthenticatedUsers" # SECURITY RISK: Any Google account can restore!
  ]
}
