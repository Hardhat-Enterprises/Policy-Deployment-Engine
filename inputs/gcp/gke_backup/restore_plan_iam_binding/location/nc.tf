resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  project        = "test-project"
  location       = "asia-south1"  # Non-compliant: not in approved regions
  name = "nc"
  role           = "roles/gkebackup.restorePlanViewer"
  
  members = [
    "user:admin@example.com",
    "serviceAccount:backup-sa@test-project.iam.gserviceaccount.com"
  ]
}