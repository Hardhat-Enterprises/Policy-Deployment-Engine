resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "group:consultants@external-contractors.com",  # SECURITY RISK: External domain!
    "group:partners@partner-collab.org"           # SECURITY RISK: Partner domain!
  ]
}
