data "google_iam_policy" "policy_with_condition" {
  binding {
    role = "roles/gkebackup.backupAdmin"
    members = ["user:tanmayshete35@gmail.com"]
    condition {
      title       = "expires_after_2025"
      description = "Expires at end of 2025"
      expression  = "request.time < timestamp('2025-12-31T00:00:00Z')"
    }
  }
}

resource "google_gke_backup_backup_plan_iam_policy" "c" {
  project  = "fluent-coder-468700-h4"
  location = "us-central1"
  name     = "test-backup-plan"
  policy_data = data.google_iam_policy.policy_with_condition.policy_data
}