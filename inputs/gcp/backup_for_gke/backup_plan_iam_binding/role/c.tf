resource "google_gke_backup_backup_plan_iam_binding" "c" {
  name                = "c"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/gkebackup.backupViewer"
  
  members = [
    "user:security-auditor@example.com",
    "group:backup-viewers@example.com"
  ]
}

