resource "google_gke_backup_restore_plan_iam_binding" "c" {
  name     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/restorePlans/prod-restore-plan"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "serviceAccount:restore-automation@fluent-coder-468700-h4.iam.gserviceaccount.com",  # SECURE: Same project SA
    "serviceAccount:dr-restore@fluent-coder-468700-h4-dr.iam.gserviceaccount.com"  # SECURE: DR project SA
  ]
}