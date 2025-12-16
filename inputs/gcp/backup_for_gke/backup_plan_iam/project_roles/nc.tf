resource "google_gke_backup_backup_plan_iam_binding" "nc" {
  name     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  role = "roles/gkebackup.backupAdmin"
  
  members = [
    "projectOwner:fluent-coder-468700-h4",  # SECURITY RISK: All project owners!
    "projectEditor:fluent-coder-468700-h4"  # SECURITY RISK: All project editors!
  ]
}