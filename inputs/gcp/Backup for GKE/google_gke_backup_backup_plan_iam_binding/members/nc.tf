resource "google_gke_backup_backup_plan_iam_member" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role   = "roles/gkebackup.backupAdmin"
  member = "allUsers"  # CRITICAL SECURITY RISK: Public access!
}
