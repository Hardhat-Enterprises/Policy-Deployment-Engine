resource "google_gke_backup_backup_plan" "nc" {
  name     = "backup-plan-no-labels"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = var.gcp_project
  # Missing labels - non-compliant
}