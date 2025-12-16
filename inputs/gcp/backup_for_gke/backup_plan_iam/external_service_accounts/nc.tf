resource "google_gke_backup_backup_plan_iam_binding" "nc" {
  name     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/backupPlans/prod-backup-plan"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  role = "roles/gkebackup.backupAdmin"
  
  members = [
    "serviceAccount:random-sa@external-project-12345.iam.gserviceaccount.com",  # SECURITY RISK: External SA!
    "serviceAccount:unknown@suspicious-proj.iam.gserviceaccount.com"  # SECURITY RISK: Unknown project!
  ]
}