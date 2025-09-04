resource "google_gke_backup_backup_plan_iam_policy" "c" {
  project  = "fluent-coder-468700-h4"
  location = "us-central1"
  name     = "prod-backup-plan"  # Compliant with pattern
  policy_data = jsonencode({
    bindings = [{
      role = "roles/gkebackup.backupAdmin"
      members = ["user:tanmayshete35@gmail.com"]
    }]
  })
}