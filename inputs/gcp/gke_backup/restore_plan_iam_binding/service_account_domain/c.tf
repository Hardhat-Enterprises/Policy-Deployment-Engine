resource "google_gke_backup_restore_plan_iam_binding" "c" {
  project        = "test-project"
  location       = "us-central1"
  name = "c"
  role           = "roles/gkebackup.restorePlanViewer"
  
  members = [
    "serviceAccount:backup-sa@test-project.iam.gserviceaccount.com",  # Compliant: approved project
    "serviceAccount:restore-sa@prod-project.iam.gserviceaccount.com",  # Compliant: approved project
    "group:backup-team@example.com"
  ]
}