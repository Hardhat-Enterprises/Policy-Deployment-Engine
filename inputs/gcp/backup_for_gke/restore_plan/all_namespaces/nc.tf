resource "google_gke_backup_restore_plan" "nc" {
  name        = "nc"
  location    = "australia-southeast1"
  project     = "PDE"
  backup_plan = "nc"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/c"

  restore_config {
    all_namespaces = true
  }
}

