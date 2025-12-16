resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  name     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/restorePlans/prod-restore-plan"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "serviceAccount:unknown-sa@random-project-12345.iam.gserviceaccount.com",  # SECURITY RISK: Unknown project!
    "serviceAccount:external@suspicious-org.iam.gserviceaccount.com"  # SECURITY RISK: External SA!
  ]
}