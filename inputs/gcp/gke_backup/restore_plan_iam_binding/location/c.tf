resource "google_gke_backup_restore_plan_iam_binding" "c" {
  project        = "test-project"
  location       = "us-central1"  # Compliant: approved region
  name = "c"
  role           = "roles/gkebackup.restorePlanViewer"
  
  members = [
    "user:admin@example.com",
    "serviceAccount:backup-sa@test-project.iam.gserviceaccount.com"
  ]
}