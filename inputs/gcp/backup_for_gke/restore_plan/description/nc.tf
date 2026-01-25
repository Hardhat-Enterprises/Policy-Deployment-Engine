resource "google_gke_backup_restore_plan" "nc" {
  name = "nc"
  location    = "australia-southeast1"
  backup_plan        = "nc"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/c"
  description = ""
  project     = "PDE"

  restore_config {
    all_namespaces = true
  }

}
