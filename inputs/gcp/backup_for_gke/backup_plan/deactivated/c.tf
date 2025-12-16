resource "google_gke_backup_backup_plan" "c" {
  name        = "active-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location    = "australia-southeast1"
  project     = var.gcp_project
  deactivated = false  # SECURITY: Backup plan is active
}