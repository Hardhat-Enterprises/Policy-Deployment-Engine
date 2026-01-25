resource "google_gke_backup_backup_plan_iam_binding" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/iam.serviceAccountUser" # Blocked by new policy
  
  members = [
    "user:random-contractor@gmail.com"
  ]
}

