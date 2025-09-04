resource "google_gke_backup_backup_plan_iam_policy" "nc" {
  project  = "fluent-coder-468700-h4"
  location = "us-central1"
  name     = "test-backup-plan"
  policy_data = jsonencode({
    bindings = [
      {
        role = "roles/gkebackup.backupAdmin"
        members = ["user:user1@gmail.com"]
      },
      {
        role = "roles/viewer"
        members = ["user:user2@gmail.com"]
      },
      {
        role = "roles/editor"
        members = ["user:user3@gmail.com"]
      },
      {
        role = "roles/owner"
        members = ["user:user4@gmail.com"]
      }
    ]  # Too many bindings - complex policy
  })
}