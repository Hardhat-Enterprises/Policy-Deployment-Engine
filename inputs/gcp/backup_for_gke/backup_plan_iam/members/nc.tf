resource "google_gke_backup_backup_plan_iam_member" "nc" {
  name     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  role   = "roles/gkebackup.backupAdmin"
  member = "allUsers"  # CRITICAL SECURITY RISK: Public access!
}