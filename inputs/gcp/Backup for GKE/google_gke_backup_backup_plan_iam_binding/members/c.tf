resource "google_gke_backup_backup_plan_iam_member" "c_g0" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role   = "roles/gkebackup.backupViewer"
  member = "serviceAccount:backup-monitor@fluent-coder-468700-h4.iam.gserviceaccount.com"
}

resource "google_gke_backup_backup_plan_iam_binding" "c_g1" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.backupViewer"
  
  members = [
    "group:backup-admins@yourdomain.com",  # SECURE: Specific group
    "user:admin@yourdomain.com"  # SECURE: Individual user
  ]
}


