resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  project        = "test-project"
  location       = "us-central1"
  name = "nc"
  role           = "roles/gkebackup.restorePlanViewer"
  
  members = [
    "user:contractor@external-domain.com",  # Non-compliant: external domain
    "user:random@gmail.com",                # Non-compliant: personal email
    "user:developer@untrusted.org"          # Non-compliant: untrusted domain
  ]
}