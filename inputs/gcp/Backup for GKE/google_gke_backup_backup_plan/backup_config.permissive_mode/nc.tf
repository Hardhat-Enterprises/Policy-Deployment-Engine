resource "google_gke_backup_backup_plan" "nc" {
  name = "nc"
  cluster  = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location = "australia-southeast1"
  project  = "PDE"
  
  backup_config {
    include_volume_data = true
    include_secrets     = false
    permissive_mode     = true
    selected_applications {
      namespaced_names {
        name = "nc"
        namespace = "ns1"
      }
    }
  }
}

