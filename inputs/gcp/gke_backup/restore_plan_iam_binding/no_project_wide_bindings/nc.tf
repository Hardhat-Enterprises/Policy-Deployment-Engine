resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  project        = "test-project"
  location       = "us-central1"
  name = "nc"
  role           = "roles/gkebackup.restorePlanAdmin"
  
  members = [
    "serviceAccount:123456789-compute@developer.gserviceaccount.com",  # Non-compliant: default compute SA
    "projectEditor:test-project",  # Non-compliant: project-wide role
    "user:admin@example.com"
  ]
}