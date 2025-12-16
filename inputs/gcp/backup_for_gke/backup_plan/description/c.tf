resource "google_gke_backup_backup_plan" "c" {
  name        = "backup-plan-with-description"
  cluster     = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster"
  location    = "australia-southeast1"
  project     = var.gcp_project
  description = "Daily backup plan for production GKE cluster with 90-day retention policy. Backs up critical namespaces and persistent volumes."
}