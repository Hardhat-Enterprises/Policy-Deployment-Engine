resource "google_gke_backup_backup_plan_iam_binding" "c" {
  name     = "c"
  location = "australia-southeast1"
  project  = "PDE"

  role = "roles/gkebackup.backupViewer"

  members = [
    "group:backup-admins@yourdomain.com", # SECURE: Specific group
    "user:admin@yourdomain.com"           # SECURE: Individual user
  ]
}
