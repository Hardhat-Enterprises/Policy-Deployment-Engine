resource "google_gke_backup_backup_plan_iam_binding" "c" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.backupViewer"
  
  members = [
    "serviceAccount:backup-sa@fluent-coder-468700-h4.iam.gserviceaccount.com",
    "group:backup-viewers@yourdomain.com"
  ]
}
