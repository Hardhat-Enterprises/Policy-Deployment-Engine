resource "google_gke_backup_restore_plan_iam_binding" "c" {
  project        = "test-project"
  location       = "us-central1"
  name           = "c"
  role           = "roles/gkebackup.restorePlanViewer"  # Compliant: least-privilege role
  
  members = [
    "user:viewer@example.com",
    "serviceAccount:readonly-sa@test-project.iam.gserviceaccount.com"
  ]
}