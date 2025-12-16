resource "google_gke_backup_restore_plan_iam_binding" "c" {
  name     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/restorePlans/prod-restore-plan"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  role = "roles/gkebackup.restoreViewer"  # SECURE: Read-only restore access
  
  members = [
    "serviceAccount:restore-monitor@fluent-coder-468700-h4.iam.gserviceaccount.com",
    "group:sre-readonly@yourdomain.com"
  ]
}