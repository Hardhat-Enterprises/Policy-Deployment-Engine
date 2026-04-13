resource "google_gke_backup_backup_plan_iam_member" "c" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role   = "roles/gkebackup.backupViewer"
  member = "serviceAccount:backup-monitor@fluent-coder-468700-h4.iam.gserviceaccount.com"
}
