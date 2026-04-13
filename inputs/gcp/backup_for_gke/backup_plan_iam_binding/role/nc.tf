resource "google_gke_backup_backup_plan_iam_binding" "nc" {
  name     = "nc"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/owner" # Blocked because member is a user

  members = [
    "user:random-contractor@gmail.com"
  ]
}

