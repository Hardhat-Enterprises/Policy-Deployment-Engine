resource "google_gke_backup_backup_plan_iam_member" "c" {
  name     = "c"
  project  = "test-project"
  location = "australia-southeast1"
  role     = "roles/gkebackup.backupPlanViewer"
  member   = "user:backup-admin@example.com"  # Compliant: specific user
}