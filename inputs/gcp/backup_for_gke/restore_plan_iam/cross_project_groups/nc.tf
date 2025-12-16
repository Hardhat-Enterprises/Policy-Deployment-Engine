resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  name     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/restorePlans/prod-restore-plan"
  location = "australia-southeast1"
  project  = var.gcp_project
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "group:external-consultants@contractor.com",  # SECURITY RISK: External domain!
    "group:random-group@untrusted.org"           # SECURITY RISK: Unknown organization!
  ]
}