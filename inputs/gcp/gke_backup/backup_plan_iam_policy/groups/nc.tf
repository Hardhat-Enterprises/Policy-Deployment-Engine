resource "google_gke_backup_backup_plan_iam_policy" "nc" {
  project  = "fluent-coder-468700-h4"
  location = "us-central1"
  name     = "test-backup-plan"
  policy_data = jsonencode({
    bindings = [{
      role = "roles/gkebackup.backupAdmin"
      members = ["user:individual1@gmail.com", "user:individual2@gmail.com", "user:individual3@gmail.com"]  # Individual users instead of group
    }]
  })
}