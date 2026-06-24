resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/owner"
  
  members = [
    "user:contractor@external.com"
  ]
}

