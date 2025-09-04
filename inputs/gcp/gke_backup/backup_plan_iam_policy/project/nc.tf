resource "google_gke_backup_backup_plan_iam_policy" "nc" {
  project  = "unauthorized-project-123"  # Non-compliant
  location = "us-central1"
  name     = "test-backup-plan"
  policy_data = jsonencode({
    bindings = [{
      role = "roles/gkebackup.backupAdmin"
      members = ["user:tanmayshete35@gmail.com"]
    }]
  })
}