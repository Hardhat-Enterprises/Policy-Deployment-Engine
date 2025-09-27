resource "google_gke_backup_restore_plan_iam_binding" "c" {
  project        = "test-project"
  location       = "us-central1"
  name = "c"
  role           = "roles/gkebackup.restorePlanViewer"
  
  members = [
    "user:backup-admin@example.com",
    "serviceAccount:backup-sa@test-project.iam.gserviceaccount.com",
    "group:backup-operators@example.com"
  ]
}