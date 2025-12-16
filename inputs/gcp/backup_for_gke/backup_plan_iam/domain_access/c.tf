resource "google_gke_backup_backup_plan_iam_binding" "c" {
  name     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  role = "roles/gkebackup.backupViewer"
  
  members = [
    "group:backup-admins@yourdomain.com",  # SECURE: Specific group
    "user:admin@yourdomain.com"  # SECURE: Individual user
  ]
}