resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  name = "nc"
  project        = "test-project"
  location       = "us-central1"
  role           = "roles/gkebackup.restorePlanAdmin"
  
  members = [
    "allUsers",  # Non-compliant: public access
    "allAuthenticatedUsers"  # Non-compliant: overly broad access
  ]
}