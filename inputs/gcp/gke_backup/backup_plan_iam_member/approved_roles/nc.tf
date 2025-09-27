resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  project        = "test-project"
  location       = "us-central1"
  name = "nc"
  role           = "roles/gkebackup.restorePlanAdmin"  # Non-compliant: excessive permissions
  
  members = [
    "user:developer@example.com",
    "serviceAccount:app-sa@test-project.iam.gserviceaccount.com"
  ]
}