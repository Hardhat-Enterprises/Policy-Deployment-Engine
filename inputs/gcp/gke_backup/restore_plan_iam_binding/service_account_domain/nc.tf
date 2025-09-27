resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  project        = "test-project"
  location       = "us-central1"
  name = "nc"
  role           = "roles/gkebackup.restorePlanViewer"
  
  members = [
    "serviceAccount:external-sa@untrusted-project.iam.gserviceaccount.com",  # Non-compliant: external project
    "serviceAccount:random-sa@suspicious-project.iam.gserviceaccount.com",    # Non-compliant: unauthorized project
    "user:developer@example.com"
  ]
}