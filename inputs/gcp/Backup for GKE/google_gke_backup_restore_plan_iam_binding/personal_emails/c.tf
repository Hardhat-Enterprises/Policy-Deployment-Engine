resource "google_gke_backup_restore_plan_iam_binding" "c" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreViewer"
  
  members = [
    "user:john.doe@yourdomain.com",  # SECURE: Company domain
    "user:jane.admin@yourdomain.com"  # SECURE: Company domain
  ]
}
