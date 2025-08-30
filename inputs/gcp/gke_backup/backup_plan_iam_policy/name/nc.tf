resource "google_gke_backup_backup_plan_iam_policy" "nc" {
  project  = "fluent-coder-468700-h4"
  location = "us-central1"
  name     = "random-backup"  # Non-compliant - wrong pattern
  policy_data = jsonencode({
    bindings = [{
      role = "roles/gkebackup.backupAdmin"
      members = ["user:tanmayshete35@gmail.com"]
    }]
  })
}