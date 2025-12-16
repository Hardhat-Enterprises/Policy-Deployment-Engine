resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  name     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/restorePlans/prod-restore-plan"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "user:johndoe123@gmail.com",  # SECURITY RISK: Personal Gmail!
    "user:contractor@hotmail.com",  # SECURITY RISK: Personal email!
    "user:admin@yahoo.com"  # SECURITY RISK: Personal email!
  ]
}