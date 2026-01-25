resource "google_gke_backup_restore_plan_iam_binding" "c" {
  name                = "c"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/gkebackup.restoreViewer"
  
  members = [
    "serviceAccount:restore-monitor@PDE.iam.gserviceaccount.com",
    "group:sre-readonly@yourdomain.com"
  ]
}

