resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "user:single-admin@gmail.com"  # SECURITY RISK: Single point of failure/compromise!
  ]
}
