resource "google_gke_backup_restore_plan_iam_binding" "c" {
  project        = "test-project"
  location       = "us-central1"
  name = "c"
  role           = "roles/gkebackup.restorePlanViewer"
  
  members = [
    "user:admin@example.com",      # Compliant: approved domain
    "user:operator@company.com",   # Compliant: approved domain
    "group:backup@example.com"
  ]
}