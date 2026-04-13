resource "google_gke_backup_backup_plan" "nc" {
  name        = "nc"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/prod-cluster"
  location    = "australia-southeast1"
  project     = "PDE"
  deactivated = true
}

