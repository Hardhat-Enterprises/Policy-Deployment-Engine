resource "google_gke_backup_backup_plan" "nc" {
  name     = "my-custom-backup-plan"
  project  = "PDE"
  cluster  = "projects/PDE/locations/us-central1/clusters/cluster-1"
  location = "us-central1"
  backup_config {
    include_volume_data = true
    include_secrets     = true
    all_namespaces      = true
  }
}
