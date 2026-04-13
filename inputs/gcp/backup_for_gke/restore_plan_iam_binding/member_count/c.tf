resource "google_gke_backup_restore_plan_iam_binding" "c" {
  name     = "rp-iam-c"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/gkebackup.restoreViewer"

  members = [
    "user:alice@example.com",
    "user:bob@example.com",
    "group:viewers@example.com"
  ]
}
