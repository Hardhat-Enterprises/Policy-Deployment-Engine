resource "google_gke_backup_backup_plan" "nc" {
  name        = "deactivated-backup-plan"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location    = "australia-southeast1"
  project     = var.gcp_project
  deactivated = true  # SECURITY RISK: No backups being created
}