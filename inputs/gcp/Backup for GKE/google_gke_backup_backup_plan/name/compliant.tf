resource "google_gke_backup_backup_plan" "compliant_example_1" {
  name     = "gke-backup-plan-daily-prod"
  project  = "PDE"
  cluster  = "projects/PDE/locations/us-central1/clusters/cluster-1"
  location = "us-central1"
  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }
}
