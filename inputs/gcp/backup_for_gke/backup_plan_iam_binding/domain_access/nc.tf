resource "google_gke_backup_backup_plan_iam_binding" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.backupAdmin"
  
  members = [
    "user:hacker@gmail.com"  # Violates personal email policy
  ]
}
