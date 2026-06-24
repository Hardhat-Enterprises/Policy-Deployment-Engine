resource "google_gke_backup_backup_plan_iam_member" "nc_g0" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role   = "roles/gkebackup.backupAdmin"
  member = "allUsers"  # CRITICAL SECURITY RISK: Public access!
}

resource "google_gke_backup_backup_plan_iam_binding" "nc_g1" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.backupAdmin"
  
  members = [
    "user:hacker@gmail.com"  # Violates personal email policy
  ]
}


