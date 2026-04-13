resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  name     = "nc"
  location = "australia-southeast1"
  project  = "PDE"

  role = "roles/gkebackup.restoreAdmin"

  members = [
    "user:johndoe123@gmail.com",   # SECURITY RISK: Personal Gmail!
    "user:contractor@hotmail.com", # SECURITY RISK: Personal email!
    "user:admin@yahoo.com"         # SECURITY RISK: Personal email!
  ]
}
