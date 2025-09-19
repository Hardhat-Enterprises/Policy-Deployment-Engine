resource "google_gke_backup_backup_plan" "nc" {
  name     = "nc"
  cluster  = "projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/test-cluster"
  location = "australia-southeast1"

  backup_config {
    all_namespaces = true
  }
}