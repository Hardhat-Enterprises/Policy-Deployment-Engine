resource "google_gke_backup_backup_plan" "compliant_example_1" {
  name                = "compliant_example_1"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = "PDE"

  backup_config {
    include_volume_data = true
    include_secrets     = false

    selected_namespaces {
      namespaces = ["production", "critical-apps"]
    }
  }
}

