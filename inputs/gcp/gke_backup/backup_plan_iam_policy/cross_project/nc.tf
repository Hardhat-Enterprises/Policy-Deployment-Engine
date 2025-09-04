resource "google_gke_backup_backup_plan_iam_policy" "nc" {
  project  = "fluent-coder-468700-h4"
  location = "us-central1"
  name     = "test-backup-plan"
  policy_data = jsonencode({
    bindings = [{
      role = "roles/gkebackup.backupAdmin"
      members = ["serviceAccount:external@different-project-123.iam.gserviceaccount.com"]  # Different project
    }]
  })
}