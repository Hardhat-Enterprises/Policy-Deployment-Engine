resource "google_gke_backup_backup_plan_iam_binding" "c" {
  name     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  role = "roles/gkebackup.backupViewer"  # SECURE: Read-only access
  
  members = [
    "user:security-auditor@example.com",
    "group:backup-viewers@example.com"
  ]
}