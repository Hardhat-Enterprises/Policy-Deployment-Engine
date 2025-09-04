resource "google_gke_backup_backup_plan_iam_policy" "nc" {
  project  = "fluent-coder-468700-h4"
  location = "asia-southeast1"
  name     = "test-backup-plan-nc"
  policy_data = jsonencode({
    bindings = [{
      role = "roles/gkebackup.backupAdmin"
      members = ["user:tanmayshete35@gmail.com"]
    }]
  })
}